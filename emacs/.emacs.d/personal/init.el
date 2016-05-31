;; Personal information
(setq user-email-address "eacosta@pointslope.com")
(setq user-full-name "Earle Acosta")
(setq calendar-latitude 26.017)
(setq calendar-longitude -80.34110799999999)
(setq calendar-location-name "Hialeah, FL")

;; All other packages will be installed via use-package
(prelude-require-packages
 '(use-package))

(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)
