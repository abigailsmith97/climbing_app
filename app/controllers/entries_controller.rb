class EntriesController < ApplicationController

    def index
        @entries = Entry.all
        #@entries = Entry.all
    end
 
    def new
        @entry1 = Entry.new()
        @entry2 = Entry.new()

    end
 
    def create
        @entry1 = Entry.new(entry_params)
        @entry2= Entry.new(entry_params)
        if @entry.save
            redirect_to root_url
        else
            render :new
        end
    end
 
    private
 
    def entry_params
        params.require(:entry1).permit(:name)
        params.require(:entry2).permit(:climb)
    end


    def destroy
        Entry.find(params[:id]).destroy
        redirect_to root_url

    end
end