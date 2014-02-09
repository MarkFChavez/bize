require 'spec_helper'

describe Project do
  context "#validations" do
    it "should require a name" do
      project = build(:project, name: "")

      expect(project).to_not be_valid
    end

    it "should have a unique name" do
      project = create(:project)
      project = build(:project, name: project.name)

      expect(project).to_not be_valid
    end
  end
end
