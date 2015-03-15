// File:    COrderDetailMgr.cs
// Created: 2012/11/28 21:13:41
// Purpose: Definition of Class COrderDetailMgr

using System;
using System.Text;
using System.Collections.Generic;
using System.Reflection;
using ErpCoreModel.Framework;

namespace ErpCoreModel.Store
{
    public class COrderDetailMgr : CBaseObjectMgr
    {

        public COrderDetailMgr()
        {
            TbCode = "DD_OrderDetail";
            ClassName = "ErpCoreModel.Store.COrderDetail";
            Assembly assembly = Assembly.LoadFrom(Assembly.GetExecutingAssembly().Location);
            ObjType = assembly.GetType(ClassName);
        }

    }
}