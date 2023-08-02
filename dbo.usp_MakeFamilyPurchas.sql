CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
	@FamilySurName VARCHAR(255)
AS
BEGIN
	DECLARE @TotalPurchase DECIMAL(18, 2);

	SELECT @TotalPurchase = SUM(B.Value)
	FROM dbo.Basket AS B
	JOIN dbo.Family AS F
	ON B.ID_Family = F.ID
	WHERE F.SurName = @FamilySurName;

	IF @TotalPurchase IS NOT NULL
	BEGIN
		UPDATE F
		SET BudgetValue = BudgetValue - @TotalPurchase
		FROM dbo.Family AS F
		WHERE F.SurName = @FamilySurName;

	END
	ELSE
	BEGIN
		PRINT 'FAMILY NOT FOUND';
	END;
END;