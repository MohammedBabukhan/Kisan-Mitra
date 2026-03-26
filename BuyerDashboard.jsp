
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Business Dashboard</title>
  <link rel="stylesheet" href="DeshbordMarchant.css">
</head>
<body>

  <div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
      <div class="logo">
        <h2>BizHub</h2>
      </div>
      <ul>
        <li><a href="DeshbordMarchant.html">Dashboard</a></li>
        <li><a href="#">Orders</a></li>
        <li><a href="#">Workers</a></li>
        <li><a href="#">Customers</a></li>
        <li><a href="#">Payments</a></li>
        <li><a href="#">Analytics</a></li>
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
          <p>12 Orders</p>
        </div>
        <div class="stat-box">
          <h3>Pending Payments</h3>
          <p>$3,500.00</p>
        </div>
        <div class="stat-box">
          <h3>Completed Orders</h3>
          <p>50 Orders</p>
        </div>
      </div>

      <div class="overview">
        <div class="orders">
          <h2>Order Management</h2>
          <table>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Worker</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
            <tr>
              <td>#501</td>
              <td>Jane Smith</td>
              <td>John Doe (Plumber)</td>
              <td>In Progress</td>
              <td><button class="btn">Assign Worker</button></td>
            </tr>
            <tr>
              <td>#502</td>
              <td>Mark Johnson</td>
              <td>Emily Davis (Electrician)</td>
              <td>Completed</td>
              <td><button class="btn">View Details</button></td>
            </tr>
            <tr>
              <td>#503</td>
              <td>Sarah Lee</td>
              <td>Chris Brown (Carpenter)</td>
              <td>Pending</td>
              <td><button class="btn">Assign Worker</button></td>
            </tr>
          </table>
        </div>

        <div class="workers">
          <h2>Worker Assignments</h2>
          <ul>
            <li>John Doe - Plumber (5 tasks)</li>
            <li>Emily Davis - Electrician (3 tasks)</li>
            <li>Chris Brown - Carpenter (4 tasks)</li>
            <li>Mark Green - Painter (2 tasks)</li>
          </ul>
        </div>
      </div>

      <div class="payments">
        <h2>Payments Overview</h2>
        <ul>
          <li><strong>Payment from Mark Johnson:</strong> $500 (Completed)</li>
          <li><strong>Payment from Sarah Lee:</strong> $250 (Pending)</li>
          <li><strong>Payment from Jane Smith:</strong> $400 (Completed)</li>
        </ul>
      </div>

      <div class="analytics">
        <h2>Business Analytics</h2>
        <div class="charts">
          <div class="chart-box">
            <h3>Monthly Earnings</h3>
            <div class="chart">[Bar Chart Placeholder]</div>
          </div>
          <div class="chart-box">
            <h3>Orders by Service</h3>
            <div class="chart">[Pie Chart Placeholder]</div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>