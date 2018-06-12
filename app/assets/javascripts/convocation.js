$(document).on('ajax:before', '.convocations a, .flags a, .restrictions a', function(e) {
  e.preventDefault();
  var link = $(e.currentTarget);

  if (link.hasClass('convocation-updater')) {
    var is_status = link.hasClass('status-updater');

    var convoId = link.closest('li').data('convocationid');
    if (is_status) {
      $('#inquirer').text('Are you sure you want to close this convocation?');
    } else {
      $('#inquirer').text('Are you sure you want to update the honor status of this convocation?');
    }
    
    $('.modal-layer').show();

    $('.modal-layer').off('click').on('click', 'button', function(e) {
      $('.modal-layer').hide();
      if ($(e.currentTarget).hasClass('red') && is_status ) {
        $.ajax({
          method: 'PUT',
          url:`/citizens/${1}/convocations/${convoId}?value=status`,
        });
      } else if ($(e.currentTarget).hasClass('red')) {
        $.ajax({
          method: 'PUT',
          url:`/citizens/${1}/convocations/${convoId}?value=honor`,
        });
      }

    });
  } else if (link.hasClass('flag-updater')) {
    var flagId = link.closest('li').data('flagid');
    $('#inquirer').text('Are you sure you want REMOVE this FLAG?');
    $('.modal-layer').show();

    $('.modal-layer').off('click').on('click', 'button', function(e) {
      $('.modal-layer').hide();
      if ($(e.currentTarget).hasClass('red') && link.hasClass('flag-updater')) {
        $.ajax({
          method: 'PUT',
          url:`/citizens/${1}/flags/${flagId}`,
        });
      }
    });
  } else if (link.hasClass('restriction-updater')) {
    var restrictionId = link.closest('div').data('restrictionid');
    $('#inquirer').text('Are you sure you want REMOVE this RESTRICTION?');
    $('.modal-layer').show();

    $('.modal-layer').off('click').on('click', 'button', function(e) {
      $('.modal-layer').hide();
      if ($(e.currentTarget).hasClass('red') && link.hasClass('restriction-updater')) {
        $.ajax({
          method: 'PUT',
          url:`/citizens/${1}/restrictions/${restrictionId}`,
        });
      }
    });
  }
  

  return false
});


$(document).on('click', '.issue-adder', function(e) {
  var button = $(e.currentTarget);
  if (button.hasClass('new_convocation')) {
    $('#new_convocation').slideToggle('fast');
  } else if (button.hasClass('new_conviction')) {
    $('#new_conviction').slideToggle('fast');
  } else if (button.hasClass('new_flag')) {
    $('#new_flag').slideToggle('fast');
  } else if (button.hasClass('new_restriction')) {
    $('#new_restriction').slideToggle('fast');
  }
});

UnobtrusiveFlash.flashOptions["timeout"] = 6000; // milliseconds




