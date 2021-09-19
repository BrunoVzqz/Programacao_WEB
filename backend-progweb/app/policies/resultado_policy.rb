class ResultadoPolicy < ApplicationPolicy
  def index?
    user.qualquer_tipo?
  end

  def show?
    user.qualquer_tipo?
  end

  def create?
    user.admin? || user.profissional_da_saude?
  end

  def update?
    user.admin? || user.profissional_da_saude?
  end

  def destroy?
    user.admin? || user.profissional_da_saude?
  end
end