package postgres

// Code generated by xo. DO NOT EDIT.

import (
	"context"
)

// AOverloadedByParamOneAndParamTwo calls the stored procedure 'public.a_overloaded(integer, integer)' on db.
func AOverloadedByParamOneAndParamTwo(ctx context.Context, db DB, paramOne, paramTwo int) error {
	// call public.a_overloaded
	const sqlstr = `CALL public.a_overloaded($1, $2)`
	// runlogf(sqlstr)
	if _, err := db.ExecContext(ctx, sqlstr, paramOne, paramTwo); err != nil {
		return logerror(err)
	}
	return nil
}