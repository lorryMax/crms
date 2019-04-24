package com.sxt.bus.utlis;

import com.sun.deploy.net.HttpResponse;
import com.sxt.bus.domain.Customer;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import java.util.List;

public class ExportCustomerUtils {
    /**
     * 导出客户数据excel
     * @param customers 客户数据
     * @param sheetName 表名
     * @param fileName 文件名
     * @param response
     */
    public static void exportCustomers(List<Customer> customers, String sheetName, String fileName, HttpResponse response) {

        //组装数据
//        创建工作部
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //设置宽
        sheet.setDefaultColumnWidth(20);
        //合并
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,5));
    }
}
