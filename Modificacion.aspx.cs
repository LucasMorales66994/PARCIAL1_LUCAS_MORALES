using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PARCIAL1_LUCAS_MORALES
{
    public partial class Modificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BTbuscar_Click(object sender, EventArgs e)
        {
            LBmensaje.Text = " ";
            if (string.IsNullOrWhiteSpace(TXTidBusqueda.Text))
                {
                LBbusqueda.Text = "ERROR: RELLENE EL CAMPO";
            }
            else
            {
                SqlDataSourceProducto.SelectParameters["idProducto"].DefaultValue = TXTidBusqueda.Text.Trim();
                SqlDataSourceProducto.DataSourceMode = SqlDataSourceMode.DataReader;

                SqlDataReader registro = (SqlDataReader)SqlDataSourceProducto.Select(DataSourceSelectArguments.Empty);

                if (registro.Read())
                {
                    TXTnombre.Text = registro["nombre"].ToString();

                    decimal precio = Convert.ToDecimal(registro["precio"]);
                    TXTprecio.Text = precio.ToString("0.00");

                    DDLcategoria.DataBind();
                    DDLcategoria.SelectedValue = registro["categoria"].ToString();

                    ViewState["origNombre"] = TXTnombre.Text;
                    ViewState["origPrecio"] = TXTprecio.Text;
                    ViewState["origCategoria"] = DDLcategoria.SelectedValue;

                    LBbusqueda.Text = "APROBADO: Producto encontrado correctamente";
                }
                else
                {

                    TXTnombre.Text = " ";
                    TXTprecio.Text = " ";
                    LBbusqueda.Text = "ERROR: Producto no encontrado";
                }
            }
          
        }
        protected void BTguardar_Click(object sender, EventArgs e)
        {

            if (ViewState["origNombre"] == null)
            {
                LBmensaje.Text = "ERROR: Producto no encontrado";
            }

            string origNom = ViewState["origNombre"].ToString();
            string origPre = ViewState["origPrecio"].ToString();
            string origCat = ViewState["origCategoria"].ToString();

            if (TXTnombre.Text.Trim()==origNom &&
                TXTprecio.Text.Trim()==origPre &&
                DDLcategoria.SelectedValue== origCat)
            {
                LBmensaje.Text = "ERROR: no se detectaron cambios";
            }

            try
            {
                SqlDataSourceProducto.UpdateParameters["nombre"].DefaultValue = TXTnombre.Text.Trim();
                SqlDataSourceProducto.UpdateParameters["precio"].DefaultValue = TXTprecio.Text.Trim();
                SqlDataSourceProducto.UpdateParameters["categoria"].DefaultValue = DDLcategoria.SelectedValue;
                SqlDataSourceProducto.UpdateParameters["idProducto"].DefaultValue = TXTidBusqueda.Text.Trim();

                int filaAfectada = SqlDataSourceProducto.Update();
                if (filaAfectada ==1 )
                {
                    LBmensaje.Text = "APROBADO: Producto actualizado correctamente";

                    ViewState["origNombre"] = TXTnombre.Text.Trim();
                    ViewState["origPrecio"] = TXTprecio.Text.Trim();
                    ViewState["origCategoria"] = DDLcategoria.SelectedValue;
                }
            }catch (Exception ex)
            {
                LBmensaje.Text = "ERROR: Error al actualizar :" + ex.Message;
            }
        }

  
    }
}