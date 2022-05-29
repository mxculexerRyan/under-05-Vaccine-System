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

<div class="container">
    <form role="form" id="manage-client">
            <div class="panel panel-primary setup-content" id="step-1">
                <div class="panel-heading">
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="text-uppercase text-sm">User Name</label>
                                <input type="text" class="form-control" name="user_Name" placeholder="User Name" required="required">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="" class="text-uppercase text-sm">Password</label>
                                <input type="password" class="form-control" name="Password" placeholder="Password">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</div>