<?php
session_start();
require('../database.php');
$servername = "iyc353.encs.concordia.ca";
$username = "iyc353_1";
$password = "folklore";
$dbname = "iyc353_1";

try {
    $conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
// set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if(isset($_POST['add_employer']))
    {
        $employer_id = $_POST['employer_id'];
        $employer_name = $_POST['employer_name'];
        $description = $_POST['description'];
        $employer_tier = $_POST['employer_tier'];

        $stmt = $conn->prepare('INSERT INTO employer (employer_id,employer_name,description,employer_tier) VALUES (?,?,?,?)');
        $stmt->execute([
            $employer_id,$employer_name,$description,$employer_tier 
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
          <h1 class="h3 mb-2 text-gray-800">Employers</h1>
          <p class="mb-4">Add new employers here</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Employer ID</th>
                      <th>Employer name</th>
                      <th>Description</th>
                      <th>Employer tier</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $query_string = "SELECT *
                                     FROM employer"; 
                        $query = $conn-> prepare($query_string);
                        $query->execute();
                        while($row = $query-> fetch()) {
                            echo "<tr><td>". $row["employer_id"]. "</td><td>". $row["employer_name"]. "</td><td>". $row["description"].
                                "</td><td>". $row["employer_tier"]. "</td></tr>";
                        }
                    ?>
                  </tbody>
                </table>
              <button style="width: 200px" type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add_posting_modal">Add New Employer</button>
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

      <!-- Modal -->
      <div class="modal fade" id="add_posting_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Add New Employer</h5>
                  </div>
                  <form method="post">
                      <div class="modal-body">
                          <form method="POST">
                              <div class="form-group">
                              <label for="employer_id"  class="col-form-label">Employer ID : </label>
                              <input type="text" name="employer_id" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="employer_name"  class="col-form-label">Employer name : </label>
                              <input type="text" name="employer_name" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="description"  class="col-form-label">Description : </label>
                              <input type="text" name="description" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="employer_tier"  class="col-form-label">Employer tier : </label>
                              <input type="text" name="employer_tier" class="form-control">
                              </div>

                              <input type="submit" name="add_employer" class="btn btn-info float-right" value="Add Employer" />
                              <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </form>
                      </div>

                  </form>
              </div>
          </div>
      </div>

      <?php
      include ('./has/scripts.php');
      ?>

</body>

</html>

