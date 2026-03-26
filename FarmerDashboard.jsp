
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Local Skilled Worker Dashboard</title>
  <link rel="stylesheet" href="DeshbordWorker.css">
</head>
<body>

  <div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
      <div class="logo">
        <h2>MyWork</h2>
      </div>
      <ul>
        <li><a href="DeshbordWorker.html">Dashboard</a></li>
        <li><a href="#">Orders</a></li>
        <li><a href="#messages">Messages</a></li>
        <li><a href="profile2.html">Profile</a></li>
        <li><a href="#">Settings</a></li>
      </ul>
    </div>
      <%
          String fname=(String) session.getAttribute("fname");
      %>
    <!-- Main Content Area -->
    <div class="main-content">
      <header>
          <h1>Welcome <%=fname%> !</h1>
      </header>

      <div class="stats">
        <div class="stat-box">
          <h3>Active Orders</h3>
          <p>3 Orders</p>
        </div>
        <div class="stat-box">
          <h3>Completed Orders</h3>
          <p>15 Orders</p>
        </div>
        <div class="stat-box">
          <h3>Earnings</h3>
          <p>$1,250.00</p>
        </div>
      </div>

      <div class="overview">
        <div class="orders">
          <h2>My Orders</h2>
          <table>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Status</th>
              <th>Deadline</th>
            </tr>
            <tr>
              <td>#12345</td>
              <td>Jane Smith</td>
              <td>In Progress</td>
              <td>Nov 25, 2024</td>
            </tr>
            <tr>
              <td>#12346</td>
              <td>Mark Johnson</td>
              <td>Completed</td>
              <td>Nov 20, 2024</td>
            </tr>
            <tr>
              <td>#12347</td>
              <td>Emily Davis</td>
              <td>Pending</td>
              <td>Nov 27, 2024</td>
            </tr>
          </table>
        </div>
  
        <div class="feedback">
          <h2>Customer Feedback</h2>
        </br>
          <ul>
            <li>"Great service, will hire again!" - ?????</li>
            <li>"Punctual and professional, very happy!" - ?????</li>
            <li>"Highly recommend, excellent quality!" - ?????</li>
          </ul>
        </div>
      </div>
   
      <div class="messages">
        <h2>Messages</h2>
        </br>
        <ul>
          <li><strong>Jane Smith:</strong> "Can you start my plumbing job?"</li>
          <li><strong>Mark Johnson:</strong> "Just wanted to confirm the timeline."</li>
          <li><strong>Emily Davis:</strong> "What time works for the meeting?"</li>
        </ul>
      </div>
    
    </div>
  </div>

</body>
</html>