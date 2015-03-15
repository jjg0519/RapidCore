﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddActivesDef.aspx.cs" Inherits="Workflow_AddActivesDef" %>
<%@ Import Namespace="ErpCoreModel" %>
<%@ Import Namespace="ErpCoreModel.Base" %>
<%@ Import Namespace="ErpCoreModel.Framework" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="ErpCoreModel.Workflow" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="../lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> 
    <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="../lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        
        $(function ()
        {
            $("#AType").ligerComboBox({
                onSelected: function (newvalue, text)
                {
                    if(text=="按用户")
                    {
                        $("#B_User_id").ligerComboBox().setEnabled();
                        $("#B_Role_id").ligerComboBox().setDisabled();
                    }
                    else
                    {
                        $("#B_User_id").ligerComboBox().setDisabled();
                        $("#B_Role_id").ligerComboBox().setEnabled();
                    }
                }
            });

        }); 


        function onSubmit() {
            $.post(
                'AddActivesDef.aspx',
                {
                <% 
                List<CBaseObject> lstCol = m_Table.ColumnMgr.GetList();
                foreach (CBaseObject obj in lstCol)
                {
                    CColumn col = (CColumn)obj;
                    if (col.Code.Equals("id", StringComparison.OrdinalIgnoreCase))
                        continue;
                    else if (col.Code.Equals("Created", StringComparison.OrdinalIgnoreCase))
                        continue;
                    else if (col.Code.Equals("Creator", StringComparison.OrdinalIgnoreCase))
                        continue;
                    else if (col.Code.Equals("Updated", StringComparison.OrdinalIgnoreCase))
                        continue;
                    else if (col.Code.Equals("Updator", StringComparison.OrdinalIgnoreCase))
                        continue;
                   
                    
                    if (col.ColType == ColumnType.bool_type)
                    {
                    %>
                    <%=col.Code %>: $("#<%=col.Code %>").attr("checked"),
                    <%}
                    else
                    { %>
                    <%=col.Code %>: $("#<%=col.Code %>").val(),
                    <%}
                  } %>
                    Action: 'PostData',
                    wfid:'<%=Request["wfid"]%>',
                    B_Company_id:'<%=Request["B_Company_id"] %>'
                },
                 function(data) {
                     if (data == "" || data == null) {
                         parent.grid.loadData();
                         parent.$.ligerDialog.close();
                         return true;
                     }
                     else {
                         $.ligerDialog.warn(data);
                         return false;
                     }
                 },
                 'text');
        } 
        function onCancel() {
            $.post(
                'AddActivesDef.aspx',
                {
                    Action: 'Cancel',
                    wfid:'<%=Request["wfid"]%>',
                    B_Company_id:'<%=Request["B_Company_id"] %>'
                },
                 function(data) {
                     if (data == "" || data == null) {
                         parent.grid.loadData();
                         parent.$.ligerDialog.close();
                         return true;
                     }
                     else {
                         $.ligerDialog.warn(data);
                         return false;
                     }
                 },
                 'text');
        } 
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
</head>
<body style="padding:10px">
    <form id="form1" >
    <div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        <% 
            //List<CBaseObject> lstCol = m_Table.ColumnMgr.GetList();
            foreach (CBaseObject obj in lstCol)
            {
                CColumn col = (CColumn)obj;

                if (col.Code.Equals("id", StringComparison.OrdinalIgnoreCase))
                    continue;
                else if (col.Code.Equals("Created", StringComparison.OrdinalIgnoreCase))
                    continue;
                else if (col.Code.Equals("Creator", StringComparison.OrdinalIgnoreCase))
                    continue;
                else if (col.Code.Equals("Updated", StringComparison.OrdinalIgnoreCase))
                    continue;
                else if (col.Code.Equals("Updator", StringComparison.OrdinalIgnoreCase))
                    continue;

                //定制元素====
                if (col.Code.Equals("WType", StringComparison.OrdinalIgnoreCase))
                {
                    %><input name="<%=col.Code %>" type="hidden" id="<%=col.Code %>" value="<%=Convert.ToInt32(ActivesType.Middle) %>"/><%
                    continue;
                }
                else if (col.Code.Equals("WF_WorkflowDef_id", StringComparison.OrdinalIgnoreCase))
                {
                    %><input name="<%=col.Code %>" type="hidden" id="<%=col.Code %>" value="<%=Request["wfid"] %>"/><%
                    continue;
                }
                else if (col.Code.Equals("Idx", StringComparison.OrdinalIgnoreCase))
                {
                    %><input name="<%=col.Code %>" type="hidden" id="<%=col.Code %>" value="<%=m_ActivesDefMgr.NewIdx() %>"/><%
                    continue;
                }
                //======
        %>
            <tr>
                <td align="right" class="l-table-edit-td"><%=col.Name %>:</td>
                <td align="left" class="l-table-edit-td">
                <%if (col.ColType == ColumnType.string_type)
                  { %>
                <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype="text" />
                <%}
                  else if (col.ColType == ColumnType.text_type)
                  { %>
                  <textarea cols="100" rows="4" class="l-textarea" id="<%=col.Code %>" style="width:400px" ></textarea>
                <%}
                  else if (col.ColType == ColumnType.int_type)
                  { %>
                  <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype='spinner' ligerui="{type:'int'}" class="required" validate="{digits:true,min:1,max:100}" />
                  <%}
                  else if (col.ColType == ColumnType.long_type)
                  { %>
                  <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype='spinner' ligerui="{type:'int'}" class="required" validate="{digits:true,min:1,max:100}" />
                  <%}
                  else if (col.ColType == ColumnType.bool_type)
                  { %>
                  <input id="<%=col.Code %>" type="checkbox" name="<%=col.Code %>" />
                  <%}
                  else if (col.ColType == ColumnType.numeric_type)
                  { %>
                  <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype="text" />
                  <%}
                  else if (col.ColType == ColumnType.guid_type)
                  { %>
                  <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype="text" />
                  <%}
                  else if (col.ColType == ColumnType.datetime_type)
                  { %>
                  <input name="<%=col.Code %>" type="text" id="<%=col.Code %>" ltype="date" validate="{required:true}" />
                  <%}
                  else if (col.ColType == ColumnType.ref_type)
                  { %>
                  <select name="<%=col.Code %>" id="<%=col.Code %>" ltype="select">
                  <option value="">(空)</option>
                  <%CTable RefTable = (CTable)Global.GetCtx(Session["TopCompany"].ToString()).TableMgr.Find(col.RefTable);
                    CBaseObjectMgr BaseObjectMgr = Global.GetCtx(Session["TopCompany"].ToString()).FindBaseObjectMgrCache(RefTable.Code, Guid.Empty);
                    if (BaseObjectMgr == null)
                    {
                        BaseObjectMgr = new CBaseObjectMgr();
                        BaseObjectMgr.TbCode = RefTable.Code;
                        BaseObjectMgr.Ctx = Global.GetCtx(Session["TopCompany"].ToString());
                    }

                    CColumn RefCol = (CColumn)RefTable.ColumnMgr.Find(col.RefCol);
                    CColumn RefShowCol = (CColumn)RefTable.ColumnMgr.Find(col.RefShowCol);
                    List<CBaseObject> lstObjRef = BaseObjectMgr.GetList();
                    foreach (CBaseObject objRef in lstObjRef)
                    { %>
	                <option value="<%=objRef.GetColValue(RefCol) %>"><%=objRef.GetColValue(RefShowCol).ToString()%></option>
	                <%} %>
                </select>
                  <%}
                  else if (col.ColType == ColumnType.enum_type)
                  { %>
                  <select name="<%=col.Code %>" id="<%=col.Code %>" ltype="select">
                  <option value="">(空)</option>
                  <%//引用显示字段优先
                      if (col.RefShowCol != Guid.Empty)
                      {
                          CTable RefTable = (CTable)Global.GetCtx(Session["TopCompany"].ToString()).TableMgr.Find(col.RefTable);
                          CBaseObjectMgr BaseObjectMgr = Global.GetCtx(Session["TopCompany"].ToString()).FindBaseObjectMgrCache(RefTable.Code, Guid.Empty);
                          if (BaseObjectMgr == null)
                          {
                              BaseObjectMgr = new CBaseObjectMgr();
                              BaseObjectMgr.TbCode = RefTable.Code;
                              BaseObjectMgr.Ctx = Global.GetCtx(Session["TopCompany"].ToString());
                          }

                          CColumn RefShowCol = (CColumn)RefTable.ColumnMgr.Find(col.RefShowCol);
                          List<CBaseObject> lstObjRef = BaseObjectMgr.GetList();
                          foreach (CBaseObject objRef in lstObjRef)
                          { %>
	                        <option value="<%=objRef.GetColValue(RefShowCol) %>"><%=objRef.GetColValue(RefShowCol)%></option>
	                    <%}
                      }
                      else
                      {
                          List<CBaseObject> lstObjEV = col.ColumnEnumValMgr.GetList();
                          foreach (CBaseObject objEV in lstObjEV)
                          {
                              CColumnEnumVal cev = (CColumnEnumVal)objEV;
                         %>
                         <option value="<%=cev.Val%>"><%=cev.Val%></option>
                      <%}
                      } %>
                </select>
                  <%} %>
                </td>
                <td align="left"></td>
            </tr>
          <%} %> 
            
        </table>
    </div>
    </form>
</body>
</html>
