import { Application } from "@hotwired/stimulus"
import SubmissionsController from "./submissions_controller"
import HelpController from "./help_controller"

const application = Application.start()

application.register("submissions", SubmissionsController)
application.register("help", HelpController)
