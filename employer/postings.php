<?php
session_start();
require('../database.php');
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
          <p class="mb-4">Add new job postings here</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Employer</th>
                      <th>Time Posted</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Number of Openings</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php

                    $employer_id = $_SESSION['employer_id'];
                    $query_string = "SELECT employer_name, posting_time, title, posting.description, 
                                    number_of_openings 
                                    FROM employer JOIN posting 
                                    ON (posting.employer_id=employer.employer_id) 
                                    WHERE employer.employer_id=$employer_id";
                        $query = $conn-> prepare($query_string);
                        $query->execute();
                        while($row = $query-> fetch()) {
                            echo "<tr><td>". $row["employer_name"]. "</td><td>". $row["posting_time"]. "</td><td>". $row["title"].
                                "</td><td>". $row["description"]. "</td><td>". $row["number_of_openings"]. "</td></tr>";
                        }
                    ?>
                  </tbody>
                </table>
              <button style="width: 200px" type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add_posting_modal">Add New Posting</button>
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
                      <h5 class="modal-title" id="exampleModalLabel">Add New Posting</h5>
                  </div>
                  <form method="post">
                      <div class="modal-body">
                          <form method="POST">

                              <div class="form-group">
                              <label for="employer_id"  class="col-form-label">Employer ID : </label>
                              <input type="text" name="employer_id" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="posting_id"  class="col-form-label">Posting ID : </label>
                              <input type="text" name="posting_id" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="title"  class="col-form-label">Title : </label>
                              <input type="text" name="title" class="form-control">
                              </div>

                              <div class="form-group">
                              <label for="description"  class="col-form-label">Description : </label>
                              <input type="text" name="description" class="form-control">
                              </div>

                              <input type="submit" name="add_posting" class="btn btn-info float-right" value="Add Posting" />
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
�
