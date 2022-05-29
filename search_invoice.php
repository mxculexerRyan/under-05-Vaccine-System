<?php
if(isset($_GET['id'])):
    $qry = $conn->query("SELECT * FROM profroma_invoice where invoice_number=" . $_GET['id'])->fetch_array();
	foreach ($qry as $k => $val) {
		$k = $val;
	}
	$inv = $conn->query("SELECT * FROM wholesale_invoices where invoice_number=" . $_GET['id']);
	$amount = $conn->query("SELECT sum(s.total_amount) as amount FROM `wholesale_invoices` s WHERE s.invoice_number=" . $_GET['id']);
	while ($row = $amount->fetch_assoc()) :
		$total_amount = $row["amount"];
	endwhile;

endif;
$product = $conn->query("SELECT * FROM product_list  order by name asc");
while ($row = $product->fetch_assoc()) :
	$prod[$row['id']] = $row;
endwhile;

echo json_encode($prod);

?>