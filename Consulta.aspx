<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="PARCIAL1_LUCAS_MORALES.Consulta" %>

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
            <h2>Catálogo de Productos</h2>
            
            <p>Listado completo de productos con sus categorías:</p>

          
            <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConexionTienda %>" 
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria_desc 
                               FROM productos AS p 
                               INNER JOIN categorias AS c ON p.categoria = c.idCategoria 
                               ORDER BY p.idProducto DESC">
            </asp:SqlDataSource>

      
            <div style="overflow-x:auto;">
                <asp:GridView ID="GVproductos" runat="server" 
                    DataSourceID="SqlDataSourceConsulta" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="idProducto"
                    CellPadding="10" 
                    GridLines="Horizontal" 
                    Width="100%" 
                    BackColor="White" 
                    BorderColor="#D1C4E9" 
                    BorderStyle="Solid" 
                    BorderWidth="1px">
                    
                    <Columns>
                        <asp:BoundField DataField="idProducto" HeaderText="ID" ReadOnly="True" SortExpression="idProducto" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre del Producto" SortExpression="nombre" />
                        
                        
                        <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" DataFormatString="{0:C}" HtmlEncode="False" />
                        
                     
                        <asp:BoundField DataField="categoria_desc" HeaderText="Categoría (Rubro)" SortExpression="categoria_desc" />
                    </Columns>
                    
                    <HeaderStyle BackColor="#673ab7" Font-Bold="True" ForeColor="White" />
                    <RowStyle ForeColor="#333" BackColor="#fdfdfd" />
                    <AlternatingRowStyle BackColor="#f4f4f9" />
                </asp:GridView>
            </div>

            <br />
            <div class="menu-navegacion">
 
                <asp:HyperLink ID="HLvolver" runat="server" NavigateUrl="~/Default.aspx">Volver a la página principal</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
