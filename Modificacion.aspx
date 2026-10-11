<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="PARCIAL1_LUCAS_MORALES.Modificacion" %>

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
            <h2>Modificar Producto</h2>
            
    
            <div class="form-group" style="background: #f4f4f9; padding: 15px; border-radius: 5px;">
                <label>Ingrese el ID del Producto a buscar:</label>
                <asp:TextBox ID="TXTidBusqueda" runat="server" CssClass="form-control" Width="150px" style="display:inline-block;"></asp:TextBox>
                <asp:Button ID="BTbuscar" runat="server" Text="Buscar" CssClass="btn-accion" OnClick="BTbuscar_Click" />
                <br /><asp:Label ID="LBbusqueda" runat="server" Font-Bold="true"></asp:Label>
            </div>

            <hr style="border: 1px solid #d1c4e9; margin: 20px 0;" />

            <div class="form-group">
                <label>Nombre del Producto:</label>
                <asp:TextBox ID="TXTnombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Precio:</label>
                <asp:TextBox ID="TXTprecio" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Categoría:</label>
                <asp:DropDownList ID="DDLcategoria" runat="server" CssClass="form-control"
                    DataSourceID="SqlDataSourceCategorias" 
                    DataTextField="descripcion" 
                    DataValueField="idCategoria">
                </asp:DropDownList>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConexionTienda %>" 
                SelectCommand="SELECT [idCategoria], [descripcion] FROM [categorias]">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceProducto" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConexionTienda %>"
                SelectCommand="SELECT * FROM productos WHERE idProducto = @idProducto"
                UpdateCommand="UPDATE productos 
                SET nombre = @nombre, precio = @precio, categoria = @categoria 
                WHERE idProducto = @idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Decimal" />
                    <asp:Parameter Name="categoria" Type="Int32" />
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="form-group">
                <asp:Button ID="BTguardar" runat="server" Text="Guardar Cambios" CssClass="btn-accion" OnClick="BTguardar_Click" />
            </div>
            
            <asp:Label ID="LBmensaje" runat="server" Font-Bold="true"></asp:Label>
            
            <div class="menu-navegacion">
                <asp:HyperLink ID="HLvolver" runat="server" NavigateUrl="~/Default.aspx">Volver a la página principal</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
