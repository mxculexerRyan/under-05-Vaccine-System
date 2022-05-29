<style>
    fieldset {
        background-color: #eeeeee;
    }

    legend {
        background-color: gray;
        color: white;
        padding: 5px 5px;
    }

    .card1 {
        width: 60rem;
        margin: auto;
        background: white;
        position: center;
        align-self: center;
        top: 50rem;
        border-radius: 1.5rem;
        box-shadow: 4px 3px 20px #3535358c;
        display: flex;
        flex-direction: row;

    }

    .leftside {
        background: #030303;
        width: 25rem;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-top-left-radius: 1.5rem;
        border-bottom-left-radius: 1.5rem;
    }



    .rightside {
        background-color: #ffffff;
        width: 35rem;
        border-bottom-right-radius: 1.5rem;
        border-top-right-radius: 1.5rem;
        padding: 1rem 2rem 3rem 3rem;
    }

    p {
        display: block;
        font-size: 1.1rem;
        font-weight: 400;
        margin: .8rem 0;
    }

    .inputbox {
        color: #030303;
        width: 100%;
        padding: 0.5rem;
        border: none;
        border-bottom: 1.5px solid #ccc;
        margin-bottom: 1rem;
        border-radius: 0.3rem;
        font-family: 'Roboto', sans-serif;
        color: #615a5a;
        font-size: 1.1rem;
        font-weight: 500;
        outline: none;
    }

    .expcvv {
        display: flex;
        justify-content: space-between;
        padding-top: 0.6rem;
    }

    .expcvv_text {
        padding-right: 1rem;
    }

    .expcvv_text2 {
        padding: 0 1rem;
    }

    .button {
        background: linear-gradient(135deg, #753370 0%, #298096 100%);
        padding: 15px;
        border: none;
        border-radius: 50px;
        color: white;
        font-weight: 400;
        font-size: 1.2rem;
        margin-top: 10px;
        width: 100%;
        letter-spacing: .11rem;
        outline: none;
    }

    .button:hover {
        transform: scale(1.05) translateY(-3px);
        box-shadow: 3px 3px 6px #38373785;
    }

    @media only screen and (max-width: 1000px) {
        .card {
            flex-direction: column;
            width: auto;

        }

        .leftside {
            width: 100%;
            border-top-right-radius: 0;
            border-bottom-left-radius: 0;
            border-top-right-radius: 0;
            border-radius: 0;
        }

        .rightside {
            width: auto;
            border-bottom-left-radius: 1.5rem;
            padding: 0.5rem 3rem 3rem 2rem;
            border-radius: 0;
        }
    }
    .select2-container .select2-selection--single {
        height: 54px !important;
    }

    .select2-container--default .select2-selection--single {
        border-top-style: hidden;
        border-right-style: hidden;
        border-left-style: hidden;
        border: 0px 0px 1px 0px solid #ccc !important;
        border-radius: 12px !important;
    }

    #tr_clone {
        display: none;
    }

    td {
        vertical-align: middle !important;
        justify-content: center;
    }

    td>input {
        margin: auto;
    }

    td p {
        margin: unset;
    }

    td input {
        height: calc(100%);
        width: calc(100%);
        border: unset;

    }

    td input:focus {
        border: unset;
        outline-width: inherit;
    }

    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
<div class="col-md-12" id="clientForm">
                <h2 class="page-title">CLIENT REGISTRATION </h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="card-body p-0">
                                <div class="bs-stepper">
                                    <div class="bs-stepper-header" role="tablist">
                                        <!-- your steps here -->
                                        <div class="step" data-target="#logins-part">
                                            <button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger">
                                                <span class="bs-stepper-circle">1</span>
                                                <span class="bs-stepper-label">Child Information</span>
                                            </button>
                                        </div>
                                        <div class="line"></div>
                                        <div class="step" data-target="#information-part">
                                            <button type="button" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger">
                                                <span class="bs-stepper-circle">2</span>
                                                <span class="bs-stepper-label">Patient / Guadians Information</span>
                                            </button>
                                        </div>
                                    </div>
                                    <form method="post" action="index.php?r=Client&page=manage-client">
                                        <div class="bs-stepper-content">
                                            <!-- your steps content here -->
                                            <div id="logins-part" class="content" role="tabpanel" aria-labelledby="logins-part-trigger">
                                                <div class="child-field">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">First Name </label>
                                                                <input type="text" class="form-control" name="FirstName" placeholder="First Name" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Middle Name </label>
                                                                <input type="text" class="form-control" name="MiddleName" placeholder="Middle Name">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Last Name </label>
                                                                <input type="text" class="form-control" name="LastName" placeholder="Last Name" required="required">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-3">
                                                            <label for="" class="text-uppercase text-sm">Gender</label>
                                                            <!-- <input type="text" class="form-control" name="Gender" id="datetimepicker4" required="required"> -->
                                                            <select name="Gender" id="" class=" custom-select inputbox browser-default select2">
                                                                <option value=""></option>
                                                                <?php
                                                                foreach ($Gender->Gender as $Gender) :
                                                                ?>
                                                                    <option value="<?= $Gender->gender_id ?>"> <?= $Gender->name ?></option>
                                                                <?php
                                                                endforeach;
                                                                ?>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="" class="text-uppercase text-sm">Date of Birth</label>
                                                            <input type="datetime-local" class="form-control" name="dob" id="dob" placeholder="Email Address" required="required">
                                                            <span id="email-availability-status" style="font-size:12px;"></span>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="" class="text-uppercase text-sm">Birth Place </label>
                                                            <select name="BirthPlace" id="" class=" custom-select inputbox browser-default select2">
                                                                <option value=""></option>
                                                                <?php
                                                                foreach ($BirthPlace->BirthPlace as $BirthPlace) :
                                                                ?>
                                                                    <option value="<?= $BirthPlace->place_id ?>"> <?= $BirthPlace->name ?></option>
                                                                <?php
                                                                endforeach;
                                                                ?>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3">
                                                            <label for="" class="text-uppercase text-sm">Birth Facilitator</label>
                                                            <select name="BirthFacilitator" id="" class=" custom-select inputbox browser-default select2">
                                                                <option value=""></option>
                                                                <?php
                                                                foreach ($BirthFacilitator->BirthFacilitator as $BirthFacilitator) :
                                                                ?>
                                                                    <option value="<?= $BirthFacilitator->facilitator_id ?>"> <?= $BirthFacilitator->name ?></option>
                                                                <?php
                                                                endforeach;
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-4 form-group">
                                                            <label for="" class="text-uppercase text-sm">Namba ya Usajili wa Vizazi </label>
                                                            <input type="text" class="form-control" name="BithCertificateNo" placeholder="Namba ya Usajili wa Vizazi " required="required">
                                                        </div>
                                                        <div class="col-md-4"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label for="" class="text-uppercase text-sm">Mtaa </label>
                                                            <input type="text" class="form-control" name="Mtaa" placeholder="Mtaa" required="required">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="" class="text-uppercase text-sm">Kijiji</label>
                                                            <input type="text" class="form-control" name="Kijiji" placeholder="Kijiji" required="required">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label for="" class="text-uppercase text-sm">Kitongoji </label>
                                                            <input type="text" class="form-control" name="Kitongoji" placeholder="Kitongoji" required="required">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="row"></div>
                                                <div class="row">
                                                    <input class="btn btn-primary" onclick="stepper.next()" value="Next">
                                                </div>
                                            </div>
                                            <div id="information-part" class="content" role="tabpanel" aria-labelledby="information-part-trigger">
                                                <fieldset>
                                                    <legend>Mother / Female Guadian: </legend>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Full Name </label>
                                                                <input type="text" class="form-control" step="any" name="FullName[]" placeholder="Full Name" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Phone Number </label>
                                                                <input type="text" class="form-control" step="any" name="Phoneno[]" placeholder="Phone  Number" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Email </label>
                                                                <input type="text" class="form-control" step="any" name="Email[]" placeholder="Email" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="" class="text-uppercase text-sm">Relationship</label>
                                                            <select step="any" name="relationship[]" style="color: #030303;width: 100%;padding: 0.5rem;border: none;border-bottom: 1.5px solid #ccc;margin-bottom: 1rem;border-radius: 0.3rem;font-family: 'Roboto', sans-serif; color: #615a5a;font-size: 1.1rem;font-weight: 500;outline: none;" id="" class="form-control custom-select inputbox browser-default select2">
                                                                <option value=""></option>
                                                                <?php
                                                                foreach ($relationship->relationship as $relationship) :
                                                                ?>
                                                                    <option value="<?= $relationship->relationship_id ?>"> <?= $relationship->name ?></option>
                                                                <?php
                                                                endforeach;
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <fieldset>
                                                    <legend>Father / Male Guadian: </legend>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Full Name </label>
                                                                <input type="text" class="form-control" step="any" name="FullName[]" placeholder="Full Name" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Phone Number </label>
                                                                <input type="text" class="form-control" step="any" name="Phoneno[]" placeholder="Phone  Number" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label for="" class="text-uppercase text-sm">Email </label>
                                                                <input type="text" class="form-control" step="any" name="Email[]" placeholder="Email" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-md-2">
                                                            <label for="" class="text-uppercase text-sm">Relationship</label>
                                                            <select step="any" name="relationship[]" style="color: #030303;width: 100%;padding: 0.5rem;border: none;border-bottom: 1.5px solid #ccc;margin-bottom: 1rem;border-radius: 0.3rem;font-family: 'Roboto', sans-serif; color: #615a5a;font-size: 1.1rem;font-weight: 500;outline: none;" id="" class="form-control custom-select inputbox browser-default select2">
                                                                <option value=""></option>
                                                                <?php
                                                                foreach ($manrelationship->relationship as $relationship) :
                                                                ?>
                                                                    <option value="<?= $relationship->relationship_id ?>"> <?= $relationship->name ?></option>
                                                                <?php
                                                                endforeach;
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <div class="row">
                                                    <input class="btn btn-secondary" onclick="stepper.previous()" value="Previous">
                                                    <input type="submit" value="Save Client" name="SaveClient" id="submit" class="btn btn-md btn-primary">
                                                </div>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>