// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import TableSorter from 'utilities/table_sorter'
import PasswordChecker from 'utilities/password_checker'
import FormInline from 'utilities/form_inline'
import ProgressBar from 'utilities/progress_bar'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  TableSorter.setSortAbilityTo("TestsTable")
  PasswordChecker.setPasswordConfirmationTo("password", "passwordConfirm")

  FormInline.setEventHandlersToLinks()
  ProgressBar.setProgressTo("passProgress")
})
