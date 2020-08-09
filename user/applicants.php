<?php
session_start();
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
        <h1 class="h3 mb-2 text-gray-800">Applicants</h1>
        <p class="mb-4">See all applicants here</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">

          <div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                  <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Phone Number</th>
                    <th>Applicant Description</th>
                    <th>Applied To Posting</th>
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
                  $employer_id = $_SESSION['employer_id'];
                  $query_string = "SELECT first_name, last_name, job_seeker.description, title, users.email
                                    FROM application 
                                        JOIN job_seeker ON (application.job_seeker_id=job_seeker.job_seeker_id) 
                                        JOIN posting ON (application.posting_id=posting.posting_id)
                                        JOIN users ON (users.user_id=job_seeker.job_seeker_id)
                                        WHERE application.employer_id=$employer_id";
                  $query = $conn-> prepare($query_string);
                  $query->execute();
                  while($row = $query-> fetch()) {
                    echo "<tr><td>". $row["first_name"]. "</td><td>". $row["last_name"]. "</td><td>".$row['email']."</td><td>DEBUG</td><td>". $row["description"].
                        "</td><td>". $row["title"]. "</td></tr>";
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

  <!-- Logout Modal-->
    <?php
    include ('./has/logout.php');
    ?>

    <?php
    include ('./has/scripts.php');
    ?>

</body>

</html>
�
