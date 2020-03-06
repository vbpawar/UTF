<?php
require_once __DIR__ . '/vendor/autoload.php';

$mpdf = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path']);
$stylesheet = file_get_contents('style.css');

// extract($_POST);
$patientId =14;//$_POST['patientId'];
$doctorId = 2;// $_POST['doctorId'];
$visitDate = '2020-03-06';//$_POST['visitDate'];

function doctor_details($doctorId)
{
    include 'connection.php';
    $output = '';
    $sql    = "SELECT um.username,um.mobile,um.sign FROM user_master um WHERE um.userId = $doctorId";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_array($result);
        global $sign;
        $sign = $row['username'];
        $output .= '<div class="col-xs-7">
        <h3><p class="font-weight-bold mb-1 "><strong>' . $row['username'] . '</strong></p></h3>
        <p class="text-muted ">' . $row['sign'] . '</p>
        <p class="text-muted ">Mobile no:' . $row['mobile'] . '  </p>
        </div>';
    }
    return $output;
}

function patients_details($patientId){
    include 'connection.php';
    $output ='';
    $sql ="SELECT pm.patientId,pm.firstName,pm.surname,pm.mobile1  from patient_master pm  where pm.patientId = $patientId ";
    $result=mysqli_query($conn,$sql);
    if(mysqli_num_rows($result)>0){
        $row=mysqli_fetch_array($result);
        $output.='
        <div class="row">
        <div class="col-md-12">
        <address>
            <div style="margin-left:550px">
            </div><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong >Reg No:</strong>'.$row['patientId'].'    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong >Name:</strong>'.$row['firstName'].' '.$row['surname'].'    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong >Contact No:</strong>'.$row['mobile1'].' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </address>
        </div>
    </div> ';
    }
    return $output;

}


function exexcise_details($patientId,$visitDate){
    include 'connection.php';
    $output ='';
    $sql ="SELECT ex.title,ex.details,ex.patientId,ex.doctorId,ex.steps,ec.Id FROM patient_prescribed_exercise  ex
    INNER JOIN  exercise_photo_master ec ON ec.title = ex.title where ex.patientId = $patientId AND ex.visitDate = '$visitDate'";
    $result=mysqli_query($conn,$sql);
    if (mysqli_num_rows($result) > 0) {
        $output .= '<div class="col-xs-12">
        <table class="table">
            <thead>
                <tr>
                    <th style="text-align:left;width:15%;" class="border-1 text-uppercase small font-weight-bold ">Photo</th>
                    <th style="text-align:left;width:15%;" class="border-1 text-uppercase small font-weight-bold ">Title</th>
                    <th style="text-align:left;width:35%;" class="border-1 text-uppercase small font-weight-bold ">Details</th>
                    <th style="text-align:left;width:35%;" class="border-1 text-uppercase small font-weight-bold ">Steps</th>

                </tr>
            </thead>
            <tbody>';
        while ($row = mysqli_fetch_array($result)) {

            $output .= '<tr>
        <td style="width="15%;">  <img class="img-fluid" src="upload/exercise/'.$row['Id'].'.jpg" width="500% " height="600%"></td>
        <td style="text-align:left;width:15%;">'.$row['title'].' </td>
        <td style="text-align:left;width:35%;">'.$row['details'].' </td>
        <td style="text-align:left;width:35%;">'.$row['steps'].' </td>
    </tr>';
        }
        $output .= '</tbody></table></div>';
    }
    return $output;

}
$html = '
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>

<div class="row">
    <div class="col-md-12">
    <div class="row p-5 " id="header">
    <div class="col-xs-4 ">
    <img class="img-fluid" src="mybrand.png" width="60% " height="70%">
    </div>
    '.doctor_details($doctorId).'
</div>

        <hr>

       '. patients_details($patientId).'
    </div>
</div>
<h3><center>Exercise Details</center></h3>

<div class="row">
    <div class="col-md-12">
    '.exexcise_details($patientId,$visitDate).'
    </div>
</div>
</body>
</html>';

// $mpdf = new mPDF('utf-8', 'A4-C');
$mpdf->WriteHTML($stylesheet, 1);
$mpdf->WriteHTML($html);

//call watermark content aand image
$mpdf->SetWatermarkText('made by vikas');
$mpdf->showWatermarkText = true;
$mpdf->watermarkTextAlpha = 0.1;
$mpdf->Output("phpflow.pdf", 'F');

$mpdf->Output();

exit;
?>
