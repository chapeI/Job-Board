<?php
session_start();
$servername = "iyc353.encs.concordia.ca";
$username = "iyc353_1";
$password = "folklore";
$dbname = "iyc353_1";

try {
    $conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
// set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if(isset($_POST['add_posting']))
    {
        $employer_id = $_POST['employer_id'];
        $posting_id = $_POST['posting_id'];
        $title = $_POST['title'];
        $description = $_POST['description'];

        $stmt = $conn->prepare('INSERT INTO posting (employer_id, posting_id, title, description) VALUES (?, ?, ?, ?)');
        $stmt->execute([
            $employer_id, $posting_id, $title, $description
        ]);
    }
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">

<?php
include ('./has/head.php');
?>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

      <?php
      include ('./has/navbar.php');
      ?>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

          <?php
          include ('./has/topbar.php');
          ?>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Postings</h1>
          <p class="mb-4">See all job postings</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div>
            <div class="card-body">
              <div class="table-responsive">
                  <input type="submit" name="add_posting" class="btn btn-info float-right" value="Apply to Google" />
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Employer</th>
                      <th>Time Posted</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Number of Openings</th>
                      <th>Apply</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php
                        $servername = "iyc353.encs.concordia.ca"; // Change this to iyc353.encs.concordia.ca if you have trouble connecting
                        $username = "iyc353_1";
                        $password = "folklore";
                        try {
                            $conn = new PDO("mysql:host=$servername;dbname=iyc353_1", $username, $password);
                            // set the PDO error mode to exception
                            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        } catch(PDOException $e) {
                            echo "Connection failed: " . $e->getMessage();
                        }
                    $query_string = "SELECT employer_name, posting_time, title, posting.description, 
                                    number_of_openings 
                                    FROM employer JOIN posting 
                                    ON (posting.employer_id=employer.employer_id) ";
                        $query = $conn-> prepare($query_string);
                        $query->execute();
                        while($row = $query-> fetch()) {
                            echo "<tr><td>". $row["employer_name"]. "</td><td>". $row["posting_time"]. "</td><td>". $row["title"].
                                "</td><td>". $row["description"]. "</td><td>". $row["number_of_openings"]. "</td><td>
                                    <button style=\"width: 100px; height: 50px\" class='btn btn-primary'>Apply</button></td></tr>";
                        }
                    ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

      <?php
      include ('./has/logout.php');
      ?>


      <?php
      include ('./has/scripts.php');
      ?>

</body>

</html>
�
