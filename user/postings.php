<?php
session_start();
require('../database.php');

$sql = "SELECT employer_name, posting_time, title, posting.description, posting_id
                                        number_of_openings 
                                        FROM employer JOIN posting 
                                        ON (posting.employer_id=employer.employer_id) ";
$statement = $conn-> prepare($sql);
$statement->execute();
$posting = $statement->fetchAll(PDO::FETCH_OBJ);

$user_id = $_SESSION['user_id'];
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
              <div class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
<!--                  <input type="submit" name="add_posting" class="btn btn-info float-right" value="Apply to Google" />-->
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th class="th-sm">Title</th>
                          <th class="th-sm">Employer</th>
                          <th class="th-sm">Time Posted</th>
                          <th class="th-sm">Description</th>
                          <th class="th-sm">Number of Openings</th>
                          <th class="th-sm">Apply</th>
                        </tr>
                      </thead>

                      <tbody>

                          <?php foreach($posting as $post): ?>
                            <tr>
                                <td><?= $post->title ?></td>
                                <td><?= $post->employer_name ?></td>
                                <td><?= $post->posting_time ?></td>
                                <td><?= $post->description ?></td>
                                <td><?= $post->number_of_openings ?></td>
                                <td>
                                    <a href="apply.php?posting_id=<?= $post->title?>" class="btn btn-info" style="width: 100%; color: white;">Apply</a>
                                </td>
                            </tr>
                          <?php endforeach; ?>
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

      <script>
          $(document).ready(function () {
              $('#dtBasicExample').DataTable();
              $('.dataTables_length').addClass('bs-select');
          });
      </script>

</body>

</html>
�
