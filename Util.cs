using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVN_Enrollment
{
    public class Util
    {

        public void ExportToExcel(DataSet ds, HttpContext ctx, String Filename)
        {
            ctx.Response.Clear();
            ctx.Response.Buffer = true;
            ctx.Response.AddHeader("content-disposition", "attachment;filename=" + Filename + ".xls");
            ctx.Response.Charset = "";
            ctx.Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView gr = new GridView();
                gr.DataSource = ds;
                gr.DataBind();
                gr.AllowPaging = false;


                gr.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gr.HeaderRow.Cells)
                {
                    cell.BackColor = gr.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gr.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gr.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gr.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gr.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                ctx.Response.Write(style);
                ctx.Response.Output.Write(sw.ToString());
                ctx.Response.Flush();
                ctx.Response.End();
            }
        }

        // show function alerts.
        public string ShowSuccess(string Message)
        {
            return "<div class='alert alert-success alert-dismissable'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" +
                                                     Message + " </div>";

        }


        public string ShowError(string Message)
        {

            return "<div class='alert alert-danger alert-dismissable'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" +
                                                     Message + " </div>";

        }


        public string ShowErrorWithoutClose(string Message)
        {

            return "<div class='alert alert-danger alert-dismissable'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" +
                                                    "<h4><i class='fa fa-times-circle'></i> Response: </h4><strong>" + Message + " </strong></div>";

        }

        public string ShowSuccessWithoutClose(string Message)
        {
            return "<div class='alert alert-success alert-dismissable'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" +
                                                    "<h4><i class='fa fa-check-circle'></i> Response: </h4><strong>" + Message + "</strong> </div>";

        }



        public string ShowInfo(string Message)
        {

            return "<div class='alert alert-info alert-dismissable'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>" +
                                                    "<h4><i class='fa fa-info-circle'></i> Information</h4>" + Message + " </div>";

        }

    }
}