<script>
    import Table from "./stats/Table.svelte";
    export let title = "TEST";
    let table;
    let results;
    export function refresh(){
        table.refresh();
    }

    function handleResults(e) {
        results = e.detail;
    }
    function handleKeyDown(e) {
        //console.log(e);
        //On Enter Search the information...
        //Get the html element so we can get the value...
        var input = e.target || e.srcElement;
        if(e.keyCode == 13){
            console.log(results);
            var value = input.value.toLowerCase();
            console.log(value);
            const nwresults = results.filter(customer => 
            customer['user']['first_name'].toLowerCase().includes(value) 
            || customer['user']['last_name'].toLowerCase().includes(value) ||
               customer['user']['email'].toLowerCase().includes(value)
               || customer['user']['address'].toLowerCase().includes(value)
               || customer['user']['dob'].toLowerCase().includes(value)
               || customer['user']['date_registered'].toLowerCase().includes(value)
            );

            table.setCustomers(nwresults);
            
        }else if(e.keyCode == 8 || input.value.length == 0){
            table.refresh();
        }
    }
</script>
<div class="panel mt4" >
        <div class="panel-content" >
            <Table on:edit on:eitem on:refresh on:results={handleResults} bind:this={table} /> 
        </div>
        <div class="panel-title">
            
            <span class="caption">{title}
                <div style="position: absolute;top: 2px;width: 70%;left: 188px;" class="input">
                    <input on:keydown={handleKeyDown} placeholder="Search Customers" type="text" />
                </div>
            </span>
            <span class="mif-apps icon"></span>
            <span class="dropdown-toggle marker-center active-toggle"></span>
            
        </div>
</div>