<%@ page import="db.DBConnector" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer's Marketplace - Contract Details</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2e7d32;
            --secondary-color: #81c784;
            --accent-color: #f9a825;
            --accent-hover: #f57f17;
            --danger-color: #e53935;
            --success-color: #43a047;
            --text-color: #333;
            --light-bg: #f5f5f5;
            --white: #fff;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --card-radius: 12px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
            color: var(--text-color);
            line-height: 1.6;
            padding: 0;
            margin: 0;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: var(--white);
            padding: 20px 0;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        
        header h1 {
            margin: 0;
            font-size: 2.5rem;
            animation: fadeInDown 1s ease-out;
        }
        
        header p {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-top: 10px;
            animation: fadeInUp 1s ease-out;
        }
        
        .header-graphic {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: 0;
        }
        
        .header-graphic svg {
            position: absolute;
            bottom: -20px;
            left: 0;
            width: 100%;
            height: auto;
            opacity: 0.1;
        }
        
        .header-content {
            position: relative;
            z-index: 1;
        }
        
        .contract-container {
            background: var(--white);
            border-radius: var(--card-radius);
            box-shadow: var(--shadow);
            padding: 30px;
            margin-bottom: 30px;
            animation: fadeIn 0.8s ease-out forwards;
        }
        
        .page-title {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid var(--secondary-color);
            padding-bottom: 10px;
        }
        
        .contract-info {
            background-color: rgba(129, 199, 132, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-color);
            font-size: 1.2rem;
            border-bottom: 1px solid #ddd;
            padding-bottom: 8px;
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px dashed #ddd;
        }
        
        .info-row:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: 500;
            flex: 1;
        }
        
        .info-value {
            font-weight: 600;
            flex: 2;
            text-align: right;
        }
        
        .contract-terms {
            margin-bottom: 30px;
        }
        
        .terms-content {
            background-color: var(--light-bg);
            padding: 20px;
            border-radius: 10px;
            max-height: 200px;
            overflow-y: auto;
            font-size: 0.9rem;
            border: 1px solid #ddd;
        }
        
        .payment-options {
            margin-bottom: 30px;
        }
        
        .payment-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
        
        .quantity-selector {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .quantity-selector label {
            margin-right: 15px;
            font-weight: 500;
        }
        
        .quantity-selector input {
            width: 100px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }
        
        .quantity-selector .mt-label {
            margin-left: 10px;
            font-weight: 500;
        }
        
        .price-calculator {
            background-color: rgba(249, 168, 37, 0.1);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .price-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
        }
        
        .price-label {
            font-weight: 500;
        }
        
        .price-value {
            font-weight: 600;
        }
        
        .total-row {
            border-top: 2px dashed #ddd;
            margin-top: 10px;
            padding-top: 10px;
            font-size: 1.1rem;
            color: var(--primary-color);
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background-color: var(--accent-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: var(--accent-hover);
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: #e0e0e0;
            color: var(--text-color);
        }
        
        .btn-secondary:hover {
            background-color: #d0d0d0;
        }
        
        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c62828;
        }
        
        .checkbox-container {
            margin: 20px 0;
            display: flex;
            align-items: center;
        }
        
        .checkbox-container input {
            margin-right: 10px;
            width: 18px;
            height: 18px;
        }
        
        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsiveness */
        @media (max-width: 768px) {
            .info-row {
                flex-direction: column;
            }
            
            .info-value {
                text-align: left;
                margin-top: 5px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 15px;
            }
            
            .action-buttons .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <%
        // Get user information for the header
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            userName = "Guest";
        }
        
        // Get the trade ID from the URL parameter
        String tradeIdStr = request.getParameter("id");
        int tradeId = 0;
        
        try {
            tradeId = Integer.parseInt(tradeIdStr);
        } catch (NumberFormatException e) {
            // Error in parameters
        }
        
        // Default values
        String commodity = "";
        String origin = "";
        double pricePerMT = 0.0;
        int availableQuantity = 0;
        String farmerName = "";
        String farmerLocation = "";
        String harvestDate = "";
        String qualityGrade = "";
        String description = "";
        
        // Get trade and farmer details from database
        if (tradeId > 0) {
            try {
                Statement st = DBConnector.getStatement();
                String query = "SELECT t.*, u.name as farmer_name, u.address FROM tradecreation t " +
                              "JOIN users u ON t.user_id = u.id " +
                              "WHERE t.id = " + tradeId;
                ResultSet rs = st.executeQuery(query);
                
                if (rs.next()) {
                    commodity = rs.getString("commodity");
                    origin = rs.getString("origin");
                    pricePerMT = rs.getDouble("price");
                    availableQuantity = rs.getInt("quantity");
                    farmerName = rs.getString("farmer_name");
                    farmerLocation = rs.getString("address");
                    
                    // Process other fields if they exist
                    try {
                        harvestDate = rs.getString("harvest_date");
                        if (harvestDate == null) harvestDate = "Not specified";
                    } catch (SQLException e) {
                        harvestDate = "Not specified";
                    }
                    
                    try {
                        qualityGrade = rs.getString("quality_grade");
                        if (qualityGrade == null) qualityGrade = "Standard";
                    } catch (SQLException e) {
                        qualityGrade = "Standard";
                    }
                    
                    try {
                        description = rs.getString("description");
                        if (description == null) description = "No description available";
                    } catch (SQLException e) {
                        description = "No description available";
                    }
                }
            } catch (SQLException e) {
                out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
            }
        }
        
        // Generate a contract ID
        String contractId = "CNT" + System.currentTimeMillis();
        
        // Format date for contract
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMMM yyyy");
        String currentDate = sdf.format(new java.util.Date());
    %>

    <header>
        <div class="header-graphic">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#ffffff" fill-opacity="1" d="M0,96L48,112C96,128,192,160,288,186.7C384,213,480,235,576,224C672,213,768,171,864,165.3C960,160,1056,192,1152,202.7C1248,213,1344,203,1392,197.3L1440,192L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
            </svg>
        </div>
        <div class="header-content">
            <h1><i class="fas fa-file-contract"></i> Contract Agreement</h1>
            <p>Review and finalize your purchase agreement</p>
        </div>
    </header>
    
    <div class="container">
        <div class="contract-container">
            <h2 class="page-title">Purchase Contract #<%= contractId %></h2>
            
            <div class="contract-info">
                <div class="section-title">Contract Information</div>
                <div class="info-row">
                    <div class="info-label">Contract Date:</div>
                    <div class="info-value"><%= currentDate %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Contract ID:</div>
                    <div class="info-value"><%= contractId %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Buyer:</div>
                    <div class="info-value"><%= userName %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Seller:</div>
                    <div class="info-value"><%= farmerName %></div>
                </div>
            </div>
            
            <div class="contract-info">
                <div class="section-title">Commodity Details</div>
                <div class="info-row">
                    <div class="info-label">Commodity:</div>
                    <div class="info-value"><%= commodity %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Origin:</div>
                    <div class="info-value"><%= origin %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Harvest Date:</div>
                    <div class="info-value"><%= harvestDate %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Quality Grade:</div>
                    <div class="info-value"><%= qualityGrade %></div>
                </div>
                <div class="info-row">
                    <div class="info-label">Available Quantity:</div>
                    <div class="info-value"><%= availableQuantity %> MT</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Price per MT:</div>
                    <div class="info-value">?<%= String.format("%,.2f", pricePerMT) %></div>
                </div>
            </div>
            
            <div class="contract-terms">
                <div class="section-title">Terms and Conditions</div>
                <div class="terms-content">
                    <p><strong>1. AGREEMENT TO PURCHASE.</strong> Buyer agrees to purchase and Seller agrees to sell the commodity described above subject to the terms and conditions of this Contract.</p>
                    <p><strong>2. PAYMENT TERMS.</strong> Payment shall be made in full at the time of contract acceptance through the approved payment methods.</p>
                    <p><strong>3. DELIVERY.</strong> Seller shall deliver the commodity to the agreed location within 7 business days from the date of payment confirmation.</p>
                    <p><strong>4. QUALITY STANDARDS.</strong> The commodity shall conform to the quality standards as specified. Any deviation from the specified quality may result in price adjustments or rejection.</p>
                    <p><strong>5. RISK OF LOSS.</strong> Risk of loss shall pass to Buyer upon delivery and acceptance of the commodity.</p>
                    <p><strong>6. DISPUTE RESOLUTION.</strong> Any dispute arising out of or in connection with this contract shall be resolved through arbitration in accordance with the rules of the Indian Council of Arbitration.</p>
                    <p><strong>7. GOVERNING LAW.</strong> This Contract shall be governed by and construed in accordance with the laws of India.</p>
                    <p><strong>8. ENTIRE AGREEMENT.</strong> This Contract constitutes the entire agreement between the parties and supersedes all prior negotiations, understandings, and agreements.</p>
                </div>
            </div>
            
            <div class="payment-options">
                <div class="section-title">Purchase Details</div>
                
                <div class="quantity-selector">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" min="1" max="<%= availableQuantity %>" value="1" onchange="calculatePrice()" onkeyup="calculatePrice()">
                    <span class="mt-label">MT</span>
                    <span style="margin-left: 15px; color: #666;">(Maximum: <%= availableQuantity %> MT)</span>
                </div>
                
                <div class="price-calculator">
                    <div class="price-row">
                        <div class="price-label">Price per MT:</div>
                        <div class="price-value">?<%= String.format("%,.2f", pricePerMT) %></div>
                    </div>
                    <div class="price-row">
                        <div class="price-label">Subtotal:</div>
                        <div class="price-value" id="subtotal">?<%= String.format("%,.2f", pricePerMT) %></div>
                    </div>
                    <div class="price-row">
                        <div class="price-label">GST (5%):</div>
                        <div class="price-value" id="gst">?<%= String.format("%,.2f", pricePerMT * 0.05) %></div>
                    </div>
                    <div class="price-row total-row">
                        <div class="price-label">Total Amount:</div>
                        <div class="price-value" id="total">?<%= String.format("%,.2f", pricePerMT * 1.05) %></div>
                    </div>
                </div>
                
                <div class="checkbox-container">
                    <input type="checkbox" id="termsCheckbox">
                    <label for="termsCheckbox">I have read and agree to the terms and conditions of this contract</label>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="viewtrade.jsp?id=<%= tradeId %>" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Go Back
                </a>
                <div>
                    <button id="rejectBtn" class="btn btn-danger" style="margin-right: 10px;">
                        <i class="fas fa-times"></i> Reject Contract
                    </button>
                    <button id="proceedBtn" class="btn btn-primary" disabled>
                        <i class="fas fa-check"></i> Proceed to Payment
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Calculate price based on quantity
        function calculatePrice() {
            const quantity = document.getElementById('quantity').value;
            const pricePerMT = <%= pricePerMT %>;
            
            // Validate quantity
            if (quantity < 1) {
                document.getElementById('quantity').value = 1;
                calculatePrice();
                return;
            }
            
            if (quantity > <%= availableQuantity %>) {
                document.getElementById('quantity').value = <%= availableQuantity %>;
                calculatePrice();
                return;
            }
            
            const subtotal = pricePerMT * quantity;
            const gst = subtotal * 0.05;
            const total = subtotal + gst;
            
            document.getElementById('subtotal').textContent = '?' + subtotal.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            document.getElementById('gst').textContent = '?' + gst.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            document.getElementById('total').textContent = '?' + total.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        }
        
        // Enable/disable proceed button based on checkbox
        document.getElementById('termsCheckbox').addEventListener('change', function() {
            document.getElementById('proceedBtn').disabled = !this.checked;
        });
        
        // Reject button handler
        document.getElementById('rejectBtn').addEventListener('click', function() {
            if (confirm('Are you sure you want to reject this contract?')) {
                window.location.href = 'viewtrade.jsp';
            }
        });
        
        // Proceed to payment button handler
        document.getElementById('proceedBtn').addEventListener('click', function() {
            const quantity = document.getElementById('quantity').value;
            window.location.href = 'paymentGateway.jsp?tradeId=<%= tradeId %>&quantity=' + quantity + '&price=<%= pricePerMT %>';
        });
        
        // Initialize price calculation
        
        calculatePrice();
        
        
    </script>
</body>
</html>
