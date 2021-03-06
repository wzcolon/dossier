module Dossier
  class ReportsController < ApplicationController

    self.responder = Dossier::Responder

    respond_to :html, :json, :csv, :xls, only: :show

    def show
      respond_with(report)
    end

    def multi
      render template: 'dossier/reports/multi', locals: {multi: report}
    end

    private

    def report_class
      Dossier.name_to_class(params[:report])
    end

    def report
      @report ||= report_class.new(options_params)
    end

    def options_params
      params[:options].presence || {}
    end

  end
end
