class NotesController < ApplicationController

  def create
    note = current_user.notes.new(note_params)
    note.save
    flash[:errors] = note.errors.full_messages

    redirect_to track_url(note.track_id)
  end

  def destroy
    note = current_user.notes.find(params[:id])
    track = note.track
    note.destroy!
    redirect_to track_url(track)
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :text)
  end
end