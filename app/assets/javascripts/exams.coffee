form = document.getElementById("new_exam")
  form.addEventListener "submit", (event) ->
    element = this

    # Create a AJAX request
    Rails.ajax
      type: "POST",
      url: "/exams",
      data: new FormData(element),
      dataType: 'script',
      success: (args...) ->
        console.log "Ajax callback function"
    document.getElementById("ajax").innerHTML ="<div>Ajax Success</div>"
    ajax(
  success: (args...) -> fire(element, 'ajax:success', args)
 
)
document.body.addEventListener 'ajax:success', (event) ->
  console.log "Ajax event callback function"
  document.getElementById("ajax").innerHTML ="<div>Ajax Success</div>"