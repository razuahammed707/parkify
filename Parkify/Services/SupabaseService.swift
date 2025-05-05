//
//  SupabaseService.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//
import Foundation
import Supabase

class SupabaseService {
    static let shared = SupabaseService()

    private init() {}

    let client = SupabaseClient(
        supabaseURL: URL(string: "https://fntjdijgrmdaopympkdc.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZudGpkaWpncm1kYW9weW1wa2RjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxMzk5NjIsImV4cCI6MjA2MTcxNTk2Mn0.tjZtZPYz4W6cuVgHGhQ9MT5RjdMapYtz6E11nHN6Yvs"
    )
    func login(email: String, password: String) async throws {
        try await client.auth.signIn(email: email, password: password)
        
    }
    func isUserLoggedIn() -> Bool {
        return client.auth.currentSession != nil
    }
}
