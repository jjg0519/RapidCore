// File:    CDiagram.cs
// Author:  甘孝俭
// email:   ganxiaojian@hotmail.com 
// QQ:      154986287
// http://www.8088net.com
// 协议声明：本软件为开源系统，遵循国际开源组织协议。任何单位或个人可以使用或修改本软件源码，
//          可以用于作为非商业或商业用途，但由于使用本源码所引起的一切后果与作者无关。
//          未经作者许可，禁止任何企业或个人直接出售本源码或者把本软件作为独立的功能进行销售活动，
//          作者将保留追究责任的权利。
// Created: 2011年7月9日 12:40:36
// Purpose: Definition of Class CDiagram

using System;
using System.Text;
using System.Collections.Generic;

namespace ErpCoreModel.Framework
{
    
    public enum DiagramType
    {
        Normal,
        SubSystem
    }
    public class CDiagram : CBaseObject
    {

        public CDiagram()
        {
            TbCode = "FW_Diagram";
            ClassName = "ErpCoreModel.Framework.CDiagram";

            Name = "";
            DType = DiagramType.Normal;
        }
        public string Name
        {
            get
            {
                if (m_arrNewVal.ContainsKey("name"))
                    return m_arrNewVal["name"].StrVal;
                else
                    return "";
            }
            set
            {
                if (m_arrNewVal.ContainsKey("name"))
                    m_arrNewVal["name"].StrVal = value;
                else
                {
                    CValue val = new CValue();
                    val.StrVal = value;
                    m_arrNewVal.Add("name", val);
                }
            }
        }


        public DiagramType DType
        {
            get
            {
                if (m_arrNewVal.ContainsKey("dtype"))
                    return (DiagramType)m_arrNewVal["dtype"].IntVal;
                else
                    return DiagramType.Normal;
            }
            set
            {
                if (m_arrNewVal.ContainsKey("dtype"))
                    m_arrNewVal["dtype"].IntVal = (int)value;
                else
                {
                    CValue val = new CValue();
                    val.IntVal = (int)value;
                    m_arrNewVal.Add("dtype", val);
                }
            }
        }


        public CTableInDiagramMgr TableInDiagramMgr
        {
            get
            {
                return (CTableInDiagramMgr)this.GetSubObjectMgr("FW_TableInDiagram", typeof(CTableInDiagramMgr));
            }
            set
            {
                this.SetSubObjectMgr("FW_TableInDiagram", value);
            }
        }

    }
}