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
//include 'includes/callAPI.php';
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
   <div class="container-fluid">
       <h3 class="py-3 text-center" >Register a Vaccine</h3>
        <form action="vaccine_reg.php" method="post">
            <div class="form-group">
                <label for="vname">Vaccine Name</label>
                <input name="vname" class="form-control mr2" type="text" placeholder="Enter Vaccine Name..">
            </div>
            <div class="form-group">
                <label for="vdesc">Vaccine Description</label>
                <input name="vdesc" class="form-control mr2" type="text" placeholder="Enter Vaccine Description..">
            </div>
            <div class="form-group">
                <input class="btn btn-success" type="button" value="Submit">
            </div>
        </form>
   </div>
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
    $('#manage-vaccine').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_vaccine',
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
