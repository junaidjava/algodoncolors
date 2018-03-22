package com.iota.web;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;

@Component("myReport")
public class ReportGenerator extends AbstractView {
	private JasperReport currentReport;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html");
		String reportName=(String) model.get("reportName");
		String format=(String) model.get("format");
		// data source
		JRDataSource dataSource = (JRDataSource) model.get("jRBeanCollectionDataSource");
		// compile jrxml template and get report
		JasperReport report = getReport(reportName);
		// fill the report with data source objects
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, null, dataSource);
		switch (format) {
		case "html":
			exportToHTML(jasperPrint,response.getWriter());
			break;

		default:
			exportToPDF(jasperPrint,response.getWriter());
		}
	}

	public JasperReport getReport(String reportName) throws JRException {
		if (currentReport == null) {// compile only once lazily
			InputStream stream = getClass().getResourceAsStream("/reports/"+reportName+".jrxml");
			currentReport = JasperCompileManager.compileReport(stream);
		}
		return currentReport;
	}

	private void exportToHTML(JasperPrint jasperPrint, PrintWriter printWriter) throws JRException {
		HtmlExporter exporter = new HtmlExporter(DefaultJasperReportsContext.getInstance());
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleHtmlExporterOutput(printWriter));
		exporter.exportReport();
	}

	private void exportToPDF(JasperPrint jasperPrint, PrintWriter writer) {
		// TODO Auto-generated method stub

	}

}
