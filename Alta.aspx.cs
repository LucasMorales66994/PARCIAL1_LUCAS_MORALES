using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PARCIAL1_LUCAS_MORALES
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTconfirmar_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(TXTnombre.Text)||
                String.IsNullOrWhiteSpace(TXTprecio.Text))
            {
                LBmensaje.Text = "ERROR: COMPLETAR AMBOS CAMPOS";
            }

            try
            {
                SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue = TXTnombre.Text.Trim();
                SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = TXTprecio.Text.Trim();

                SqlDataSourceProductos.InsertParameters["categoria"].DefaultValue = DDLcategoria.SelectedValue;
                SqlDataSourceProductos.Insert();

                LBmensaje.Text = "APROBADO: Producto cargado correctamente";
                TXTnombre = null;
                TXTprecio = null;

            }catch (Exception ex) 
                {
                LBmensaje.Text = "ERROR: Ocurrió algo..." +ex.Message;
                }

        }

    }
}