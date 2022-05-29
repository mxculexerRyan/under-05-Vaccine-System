<?php
include 'db_connect.php';
if (isset($_POST['csv'])) {
	header('Content-Type: text/csv; charset=utf-8');

	header('Content-Disposition: attachment; filename=DevelopersData.csv');
	
	$output = fopen("php://output", "w");
	fputcsv($output, array('pid','uid','Name','Brand Name','batch','Qty', 'Buying Price','Selling Price','Wholesale Price','Expire Date'));
	$sql = "SELECT p.id as pid,u.item_units_id as uid,concat(p.name, ' ',ifnull(p.measurement, ''), '  ',' ',ifnull(p.description,''),'(',ifnull(u.item_units_name, ''),')') AS name,ifnull(p.description,'') as 'Brand Name','','' as Qty,'' as 'Buying Price',p.price as 'Selling Price',p.wholesale_price as 'Wholesale Price','' as 'Expire Date' FROM product_list p
                INNER JOIN item_units u on u.item_units_id=p.item_units_id
            order by p.id";
	$qry = mysqli_query($conn, $sql);
	while($row= mysqli_fetch_assoc($qry))
	{
		fputcsv($output, $row);
	}
	fclose($output);
}
?>