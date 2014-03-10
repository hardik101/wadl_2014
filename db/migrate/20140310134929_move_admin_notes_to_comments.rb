class MoveAdminNotesToComments < ActiveRecord::Migration
  def self.up
    remove_index  :admin_notes, [:member_type, :member_id]
    rename_table  :admin_notes, :active_admin_comments
    rename_column :active_admin_comments, :member_type, :author_type
    rename_column :active_admin_comments, :member_id, :author_id
    add_column    :active_admin_comments, :namespace, :string
    add_index     :active_admin_comments, [:namespace]
    add_index     :active_admin_comments, [:author_type, :author_id]

    # Update all the existing comments to the default namespace
    say "Updating any existing comments to the #{ActiveAdmin.application.default_namespace} namespace."
    comments_table_name = ActiveRecord::Migrator.proper_table_name("active_admin_comments")
    execute "UPDATE #{comments_table_name} SET namespace='#{ActiveAdmin.application.default_namespace}'"
  end

  def self.down
    remove_index  :active_admin_comments, :column => [:author_type, :author_id]
    remove_index  :active_admin_comments, :column => [:namespace]
    remove_column :active_admin_comments, :namespace
    rename_column :active_admin_comments, :author_id, :member_id
    rename_column :active_admin_comments, :author_type, :member_type
    rename_table  :active_admin_comments, :admin_notes
    add_index     :admin_notes, [:member_type, :member_id]
  end
end
