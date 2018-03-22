package com.iota.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;

import com.iota.model.Order;
import com.iota.repository.OrderRepository;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;

@Controller
public class JasperController {
	private static final Logger logger = LoggerFactory.getLogger(JasperController.class);

	@Autowired
	private OrderRepository orderRepository;

	@GetMapping("/report")
	public String reportWithData(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		String reportName=ServletRequestUtils.getStringParameter(request, "reportName");
		String format=ServletRequestUtils.getStringParameter(request, "format", "html");
		logger.debug("report name: {} format: {}" , reportName,format);
		// data source
		JRDataSource dataSource = getReportData(reportName);
		// compile jrxml template and get report
		JasperReport jasperReport = getCompiledReport(reportName);
		// fill the report with data source objects
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource);
		switch (format) {
		case "html":
			exportToHTML(jasperPrint,response.getWriter());
			break;

		default:
			exportToPDF(response,null,jasperReport,dataSource);
		}

		return null;
	}

	private JRDataSource getReportData(String reportName) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		logger.debug("getting report data");
		Method repMethod=ReflectionUtils.findMethod(this.getClass(), reportName+"Data");
		logger.debug("repMethod is " + repMethod);
		JRDataSource dataSource = (JRDataSource) ReflectionUtils.invokeMethod(repMethod, this);
		return dataSource;
	}

	public JRDataSource myReportData(){
		List<Order> orderList = orderRepository.findAll();
		logger.debug("orderList.size() " + orderList.size());
		return new JRBeanCollectionDataSource(orderList);
	}

	private JasperReport getCompiledReport(String reportName) throws JRException {
		InputStream stream = getClass().getResourceAsStream("/reports/"+reportName+".jrxml");
		return JasperCompileManager.compileReport(stream);
	}

	private void exportToHTML(JasperPrint jasperPrint, PrintWriter printWriter) throws JRException {
		HtmlExporter exporter = new HtmlExporter();
		//HtmlExporter exporter = new HtmlExporter(DefaultJasperReportsContext.getInstance());
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.setExporterOutput(new SimpleHtmlExporterOutput(printWriter));
		exporter.exportReport();
	}

	private void exportToPDF(HttpServletResponse resp, Map<String, Object> parameters,JasperReport jasperReport, JRDataSource dataSource) throws JRException, IOException {
		byte[] bytes = null;
        bytes = JasperRunManager.runReportToPdf(jasperReport,parameters,dataSource);
        resp.reset();
        resp.resetBuffer();
        resp.setContentType("application/pdf");
        resp.setContentLength(bytes.length);
        ServletOutputStream ouputStream = resp.getOutputStream();
        ouputStream.write(bytes, 0, bytes.length);
        ouputStream.flush();
        ouputStream.close();

	}
}
