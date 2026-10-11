using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PARCIAL1_LUCAS_MORALES
{
    public partial class Baja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTeliminar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TXTidproducto.Text))
            {
                LBmensaje.Text = "ERROR: COMPLETAR EL CAMPO ID";
            }

            try
            {
                SqlDataSourceBaja.DeleteParameters["idProducto"].DefaultValue = TXTidproducto.Text.Trim();

                int cantidadBorradas = SqlDataSourceBaja.Delete();

                if (cantidadBorradas == 1)
                {
                    LBmensaje.Text = "APROBADO: Borrado correctamente del sistema";
                }
                else
                {
                    LBmensaje.Text = "ERROR: No se pudo borrar el producto";
                }
            }
            catch (Exception ex)
            {
                LBmensaje.Text = "ERROR: Error durante el borrado: " + ex.Message;
            }
        }
    }
}