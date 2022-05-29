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
<?php
include 'includes/callAPI.php';
$json_uom = callAPI('GET', 'http://localhost/uvmis/api/v1/uoms/ListAllUOM.php', false);
$uoms = json_decode($json_uom);
$json_Gender = callAPI('GET', 'http://localhost/uvmis/api/v1/gender/gender.php', false);
$Gender = json_decode($json_Gender);
$json_BirthPlace = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/BirthPlace.php', false);
$BirthPlace = json_decode($json_BirthPlace);
$json_relationship = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/relationship.php', false);
$relationship = json_decode($json_relationship);
$manrelationship = json_decode($json_relationship);
$json_BirthFacilitator = callAPI('GET', 'http://localhost/uvmis/api/v1/Birth/BirthFacilitator.php', false);
$BirthFacilitator = json_decode($json_BirthFacilitator);
$json_client = callAPI('GET', 'http://localhost/uvmis/api/v1/client/Listclient.php', false);
$client = json_decode($json_client);
?>
<div class="container">
    <div class="stepwizard">
        <div class="stepwizard-row setup-panel row">
            <div class="stepwizard-step col-md-3">
                <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                <p><small>Client</small></p>
            </div>
            <div class="stepwizard-step col-md-3">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p><small>Additional Information</small></p>
            </div>
            <div class="stepwizard-step col-md-3">
                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                <p><small>Locations</small></p>
            </div>
            <div class="stepwizard-step col-md-3">
                <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
                <p><small>Patient / Guadians Information</small></p>
            </div>
        </div>
    </div>

    <form role="form" id="manage-client">
        <div class="panel panel-primary setup-content" id="step-1">
            <div class="panel-heading">
                <h3 class="panel-title">Client</h3>
            </div>
            <div class="panel-body">
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
                    <div class="form-group col-md-4">
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
                    <div class="form-group col-md-4">
                        <label for="" class="text-uppercase text-sm">Date of Birth</label>
                        <input type="datetime-local" class="form-control" name="dob" id="dob" placeholder="Email Address" required="required">
                        <span id="email-availability-status" style="font-size:12px;"></span>
                    </div>
                    <div class="col-md-4 form-group">
                        <label for="" class="text-uppercase text-sm">Namba ya Usajili wa Vizazi </label>
                        <input type="text" class="form-control" name="BithCertificateNo" placeholder="Namba ya Usajili wa Vizazi " required="required">
                    </div>
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>

        <div class="panel panel-primary setup-content" id="step-2">
            <div class="panel-heading">
                <h3 class="panel-title">Additional Information</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-md-6">
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
                    <div class="form-group col-md-6">
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
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>

        <div class="panel panel-primary setup-content" id="step-3">
            <div class="panel-heading">
                <h3 class="panel-title">Location</h3>
            </div>
            <div class="panel-body">
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
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>

        <div class="panel panel-primary setup-content" id="step-4">
            <div class="panel-heading">
                <h3 class="panel-title">Patient / Guadians Information</h3>
            </div>
            <div class="panel-body">
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
            </div>
        </div>
    </form>
</div>
<script>
    $('.select2').select2({
        placeholder: "Please Select",
        width: "100%"
    })
    $(document).ready(function(e) {
        var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

        allWells.hide();

        navListItems.click(function(e) {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                $item = $(this);

            if (!$item.hasClass('disabled')) {
                navListItems.removeClass('btn-success').addClass('btn-default');
                $item.addClass('btn-success');
                allWells.hide();
                $target.show();
                $target.find('input:eq(0)').focus();
            }
        });

        allNextBtn.click(function() {
            var curStep = $(this).closest(".setup-content"),
                curStepBtn = curStep.attr("id"),
                nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                curInputs = curStep.find("input[type='text'],input[type='url']"),
                isValid = true;

            $(".form-group").removeClass("has-error");
            for (var i = 0; i < curInputs.length; i++) {
                if (!curInputs[i].validity.valid) {
                    isValid = false;
                    $(curInputs[i]).closest(".form-group").addClass("has-error");
                }
            }

            if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
        });

        $('div.setup-panel div a.btn-success').trigger('click');
    })
    $('#manage-client').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_client',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp ==1){
					alert_toast("Data successfully saved",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}else{
                    alert_toast("Data Not saved /n "+resp,'danger')
                    console.log(resp)
                    setTimeout(function(){
                        console.log(resp)
						location.reload()
					},17500)
                }
			}
		})
	})
</script>