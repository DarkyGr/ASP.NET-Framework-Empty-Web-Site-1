using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    public String tipoMenu = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            tipoMenu = "0";
        }
        else
        {
            tipoMenu = Request.QueryString["id"];
        }

        TransformaXML();
    }

    private void TransformaXML()
    {
        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/icursos.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";

        XmlTextReader trMenu = new XmlTextReader(xmlPath);

        // Credenciales
        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;

        /*
         * Crea la configuracion para poder accdeder al XSLT
         * los parametros true son para poder tratar al xslt
         * como documento y poder trasnformarlo
         */
        XsltSettings settings = new XsltSettings(true, true);

        // Leer XSLT    
        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);

        // Creamos a donde enviar la tranformacion
        StringBuilder sBuilder = new StringBuilder();
        TextWriter tWriter = new StringWriter(sBuilder);
        XsltArgumentList xsltArgs = new XsltArgumentList();
        xsltArgs.AddParam("TipoMenu", "", tipoMenu);
        xslt.Transform(trMenu, xsltArgs, tWriter);
        string resultado = sBuilder.ToString();
        Response.Write(resultado);
    }
}