<script>
    import {createEventDispatcher} from "svelte";
    const dispatch = createEventDispatcher();
    let fname;
    let mname;
    let lname;
    let em;
    let dob;
    let address;

    function handleSubmit() {
        var form = new FormData();
        form.append("fname", fname);
        form.append("mname", mname);
        form.append("lname", lname);
        form.append("email", em);
        form.append("dob", dob);
        form.append("address", address);
        console.log(form);
        console.log(em);
        fetch("/api/v1/add/customer", {
            method: 'post',
            body: form,
        }).then(()=>{
            dispatch("refresh");
        });

    }


</script>
<style>
    .window{
        position: absolute;
        width: 600px;
        height: 640px;
        top: 50%;
        left: 50%;
        margin-left: -300px;
        margin-top: -320px;
    }
    .window-content {
        overflow: auto;
    }

</style>
<div class="window">
    <div class="window-caption">
        <span class="icon mif-user-plus"></span>
        <span class="title">Add Customer</span>
        <div class="buttons">
          
            <span on:click="{()=>{dispatch("close", false)}}" class="btn-close"></span>
        </div>
    </div>
    <div class="window-content p-2">
        <form>
            <div class="form-group">
                <label>First Name</label>
                <input bind:value={fname} type="text" placeholder="Enter First Name"/>
                
            </div>
            <div class="form-group">
                <label>Middle Name</label>
                <input bind:value={mname} type="text" placeholder="Enter Middle Name"/>
                
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <input bind:value={lname} type="text" placeholder="Enter Last Name"/>
                
            </div>

            <div class="form-group">
                <label>Date Of Birth</label>
                <div class="input calendar-picker">
                      <input bind:value={dob} type="date" placeholder="Enter DOB"/>
                </div>
              
            </div>
            <div class="form-group">
               <label>E-mail</label>
               <input bind:value={em} type="email" placeholder="Enter Email"/>
            </div>
            <div class="form-group">
                <label>Address</label>
                <textarea bind:value={address}  style="height: 64px;" ></textarea>
            </div>
           
            <div class="form-group">
                <button on:click|preventDefault={handleSubmit} class="button success">Submit data</button>
                <input on:click="{()=>{dispatch("close", false)}}" type="button" class="button" value="Cancel">
            </div>
        </form>
    </div>
</div>
