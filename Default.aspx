<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PARCIAL1_LUCAS_MORALES.Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lucas Morales Parcial 1</title>

    <link href="Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Tienda Digital Retro</h1>
            <p>Proyecto de Lucas Morales</p>
            
            <div class="menu-navegacion">
                <asp:HyperLink ID="HLalta" runat="server" NavigateUrl="~/Alta.aspx">Cargar_Nuevo_Producto</asp:HyperLink>
                <asp:HyperLink ID="HLconsulta" runat="server" NavigateUrl="~/Consulta.aspx">Consultar_Productos</asp:HyperLink>
                <asp:HyperLink ID="HLmodificacion" runat="server" NavigateUrl="~/Modificacion.aspx">Modificar_Productos</asp:HyperLink>
                <asp:HyperLink ID="HLbaja" runat="server" NavigateUrl="~/Baja.aspx">Eliminar_Productos</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>