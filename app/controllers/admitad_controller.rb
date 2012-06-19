class AdmitadController < ApplicationController
  def verify
    respond_to do |format|
      format.html { render :layout => false }
    end
  end
end
