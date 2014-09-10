jQuery ->
  Stripe.setPublishableKey('pk_test_BDf3pSal468zACI7Pk9h4gM0')
  subscription.setupForm()

subscription =
  setupForm: ->
    $('#new_donation').submit ->
      $('input[type=submit]').attr('disabled', true)
      subscription.processCard()

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, subscription.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#donation_token').val(response.id)
      $('#new_donation')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
