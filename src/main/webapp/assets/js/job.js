$(function(){
    $.ajax({
        url: 'http://localhost:8090/jobData.do',
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log('data');
            console.log(data);
            console.log(data.jobs.job);
        }
    });

});