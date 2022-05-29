<?php
include 'db_connect.php';
if (isset($_POST['csv'])) {
	header('Content-Type: text/csv; charset=utf-8');

	header('Content-Disposition: attachment; filename=DevelopersData.csv');
	
	$output = fopen("php://output", "w");
	fputcsv($output, array('product_id','uid','Name','Buying Price','Selling Price','Wholesale Price'));
	$sql = "SELECT pl.id as product_id,pl.item_units_id as uid,concat(pl.name, ' ',ifnull(pl.measurement, ''), '  ',' ',ifnull(pl.description,''),'(',ifnull(u.item_units_name, ''),')') AS name,price.price_list_buying_pice buying_price,price.price_list_selling_price selling_price,price.price_list_wholesale_price wholesale_price FROM product_list pl 
                INNER JOIN item_units u ON u.item_units_id=pl.item_units_id
                LEFT JOIN price_list price ON pl.id=price.product_id and price.voided=0 
            ORDER BY pl.id";
	$qry = mysqli_query($conn, $sql);
	while($row= mysqli_fetch_assoc($qry))
	{
		fputcsv($output, $row);
	}
	fclose($output);
}
?>