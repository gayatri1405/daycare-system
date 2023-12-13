<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daycare Food Menu</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .delete-btn {
            padding: 2px 8px;
            background-color: #f44336;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div>	<jsp:include page="nav.jsp" /></div>
    <h2>Daycare Food Menu</h2>
    

    <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            Statement st = con.createStatement();
            String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            
            // Check if menu already exists for the current date
            ResultSet existingMenu = st.executeQuery("SELECT * FROM menu WHERE menu_date = '" + currentDate + "'");
            boolean menuExists = existingMenu.next();
            
            if (!menuExists) {
                // Retrieve all food items from the database
                ResultSet foodItemsResult = st.executeQuery("SELECT * FROM food_items");
                List<String> foodItems = new ArrayList<>();
                while (foodItemsResult.next()) {
                    String foodItem = foodItemsResult.getString("item_name");
                    foodItems.add(foodItem);
                }
                
                // Generate a random menu from the food items
                int menuSize = 3;  // Specify the desired menu size
                List<String> menu = new ArrayList<>();
                Random random = new Random();
                
                for (int i = 0; i < menuSize; i++) {
                    int randomIndex = random.nextInt(foodItems.size());
                    String menuItem = foodItems.get(randomIndex);
                    menu.add(menuItem);
                }
                
                // Store the generated menu in the database with the current date
                PreparedStatement ps = con.prepareStatement("INSERT INTO menu (menu_date, menu_item) VALUES (?, ?)");
                
                for (String menuItem : menu) {
                    ps.setString(1, currentDate);
                    ps.setString(2, menuItem);
                    ps.executeUpdate();
                }
            }
            
            // Display the menu
            ResultSet menuResult = st.executeQuery("SELECT * FROM menu WHERE menu_date = '" + currentDate + "'");
            if (menuResult.next()) {
                out.println("<h3>Today's Menu</h3>");
                out.println("<table>");
                out.println("<tr><th>Date</th><th>Menu Item</th><th>Delete</th></tr>");
                
                do {
                    String date = menuResult.getString("menu_date");
                    String menuItem = menuResult.getString("menu_item");
                    int id = menuResult.getInt("id");
                    
                    out.println("<tr>");
                    out.println("<td>" + date + "</td>");
                    out.println("<td>" + menuItem + "</td>");
                    out.println("<td><button class=\"delete-btn\" onclick=\"deleteMenu(" + id + ")\">Delete</button></td>");
                    out.println("</tr>");
                } while (menuResult.next());
                
                out.println("</table>");
            } else {
                out.println("<p>No menu found for today.</p>");
            }
            
            con.close();
        } catch (ClassNotFoundException e) {
            out.println(e.getMessage());
        } catch (SQLException s) {
            out.println(s.getMessage());
        }
    %>

    <script>
        function deleteMenu(id) {
            if (confirm("Are you sure you want to delete this menu item?")) {
                // Send an AJAX request to delete the menu item
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "deleteMenu.jsp?id=" + id, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Refresh the page after successful deletion
                            location.reload();
                        } else {
                            alert("Failed to delete the menu item.");
                        }
                    }
                };
                xhr.send();
            }
        }
    </script>
</body>
</html>
