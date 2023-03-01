---@class Account
---@field balance number
---@field new fun(self: Account, o: table): Account
local Account = { balance = 0 }

---@param v number
---@return nil
function Account:deposit (v)
  self.balance = self.balance + v
end

