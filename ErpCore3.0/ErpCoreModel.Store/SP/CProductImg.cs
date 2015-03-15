// File:    CProductImg.cs
// Author:  甘孝俭
// email:   ganxiaojian@hotmail.com 
// QQ:      154986287
// http://www.8088net.com
// 协议声明：本软件为开源系统，遵循国际开源组织协议。任何单位或个人可以使用或修改本软件源码，
//          可以用于作为非商业或商业用途，但由于使用本源码所引起的一切后果与作者无关。
//          未经作者许可，禁止任何企业或个人直接出售本源码或者把本软件作为独立的功能进行销售活动，
//          作者将保留追究责任的权利。
// Created: 2012/11/28 21:13:41
// Purpose: Definition of Class CProductImg

using System;
using System.Text;
using ErpCoreModel.Framework;

namespace ErpCoreModel.Store
{
    
    public class CProductImg : CBaseObject
    {

        public CProductImg()
        {
            TbCode = "SP_ProductImg";
            ClassName = "ErpCoreModel.Store.CProductImg";

        }

        
        public Guid SP_Product_id
        {
            get
            {
                if (m_arrNewVal.ContainsKey("sp_product_id"))
                    return m_arrNewVal["sp_product_id"].GuidVal;
                else
                    return Guid.Empty;
            }
            set
            {        
                if (m_arrNewVal.ContainsKey("sp_product_id"))
                    m_arrNewVal["sp_product_id"].GuidVal = value;
                else
                {
                    CValue val = new CValue();
                    val.GuidVal = value;
                    m_arrNewVal.Add("sp_product_id", val);
                }
            }
        }
        public string Url
        {
            get
            {
                if (m_arrNewVal.ContainsKey("url"))
                    return m_arrNewVal["url"].StrVal;
                else
                    return "";
            }
            set
            {
                if (m_arrNewVal.ContainsKey("url"))
                    m_arrNewVal["url"].StrVal = value;
                else
                {
                    CValue val = new CValue();
                    val.StrVal = value;
                    m_arrNewVal.Add("url", val);
                }
            }
        }

        public string GetName()
        {
            string sUrl = Url;
            if (string.IsNullOrEmpty(sUrl))
                return "";
            string[] arr = sUrl.Split("|".ToCharArray());
            if (arr.Length == 2)
                return arr[1];

            return sUrl;
        }
        public string GetFileName()
        {
            string sUrl = Url;
            if (string.IsNullOrEmpty(sUrl))
                return "";
            string[] arr = sUrl.Split("|".ToCharArray());
            if (arr.Length == 2)
                return arr[0];

            return sUrl;
        }
    }
}