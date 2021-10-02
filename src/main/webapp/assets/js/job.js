$(function(){
    $.ajax({
        url: 'http://localhost:8090/OkkyClone_war_exploded/jobData.do',
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log('data');
            console.log(data);
            console.log(data.jobs.job);
        }
    });

});