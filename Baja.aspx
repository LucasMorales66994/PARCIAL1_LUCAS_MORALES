<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="PARCIAL1_LUCAS_MORALES.Baja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link href="Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h2>Eliminar Producto</h2>
            
            <p style="color: #666;">Escribir ID del producto para borrarlo</p>

            <div class="form-group" style="background: #ffebee; padding: 15px; border-radius: 5px; border-left: 5px solid #f44336;">
                <label style="color: #c62828;">ID del Producto a eliminar:</label>
                <asp:TextBox ID="TXTidproducto" runat="server" CssClass="form-control" Width="150px" style="display:inline-block;"></asp:TextBox>
                
                <asp:Button ID="BTeliminar" runat="server" Text="Eliminar" CssClass="btn-accion" style="background-color: #d32f2f;" 
                    OnClientClick="return confirm('¿Continuar con la baja? mensaje advertencia');" 
                    OnClick="BTeliminar_Click" />
            </div>

            <asp:SqlDataSource ID="SqlDataSourceBaja" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConexionTienda %>"
                DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <asp:Label ID="LBmensaje" runat="server" Font-Bold="true"></asp:Label>
            
            <div class="menu-navegacion" style="margin-top: 20px;">
                <asp:HyperLink ID="HLvolver" runat="server" NavigateUrl="~/Default.aspx">Volver a la página principal</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
