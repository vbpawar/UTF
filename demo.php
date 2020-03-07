<?php
require_once __DIR__ . '/vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path']);
$stylesheet = file_get_contents('style.css');

$html = '<table class="table">
    <tr>
        <td><label> अथॉरिटी का नाम: <span>*</span></label></td>
        <td>अथॉरिटी का नाम:</td>
    </tr>
    <tr>
        <td><label> आवेदक का नाम  <span>*</span></label></td>
        <td>k</td>
    </tr>
    <tr>
        <td><label> आवदेक का पता  : <span>*</span></label></td>
        <td>v</td>
    </tr>
    <tr>
        <td><label> भूखण्ड संख्या : <span>*</span></label></td>
        <td>v</td>
    </tr>
    <tr>
        <td><label> योजना का नाम : <span>विकास पवार</span></label></td>
        <td></td>
    </tr>
    </table>';


// $mpdf = new mPDF('utf-8', 'A4-C');
$mpdf->WriteHTML($stylesheet, 1);
$mpdf->WriteHTML($html);

//call watermark content aand image
$mpdf->SetWatermarkText('praxello');
$mpdf->showWatermarkText = true;
$mpdf->watermarkTextAlpha = 0.1;
$mpdf->Output("phpflow.pdf", 'F');

$mpdf->Output();

exit;
?>
