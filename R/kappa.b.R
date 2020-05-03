
# This file is a generated template, your changes will not be overwritten

kappaClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "kappaClass",
    inherit = kappaBase,
    private = list(
        .init = function() {
            preformatted <- jmvcore::Preformatted$new(self$options, 'pre')
            self$results$add(preformatted)
        },
        .run = function() {
            preformatted <- self$results$get('pre')
            preformatted$content <- ''
            
            if (length(self$options$dep) != 2)
                return()
           
            data = self$data
            vars <-data[c(self$options$dep)]
            
           
            results <- cohen.kappa(x = vars)
            
            irr.kappa <- kappa2(vars, weight = self$options$weights)
            if(self$options$weights == "unweighted"){
                n = 1
            } else {
                n = 2
            }
            
            table <- self$results$ka

            table$setRow(rowNo=1, values=list(
                weights = self$options$weights,
                kappa=irr.kappa$value,
                upper_CI=results$confid[1,3],
                lower_CI=results$confid[1,1],
                p = irr.kappa$p.value
                ))
            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)

        })
)
